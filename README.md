### Objetivos
- Prática de IAC com Terraform e Cloud AWS.
    - Terraform deve ser modular
    - Deve prover RemoteState e StateLock.
    - Git deve ser a fonte de verdade
    - Deve permitir deploy multi-ambiente
        - Ambiente dev o mais próximo possível de prod.
        - Dev: Dimensão menor de recursos, algumas features de resiliência e disponibilidade desabilitadas por billing 
            - exemplo: **Prod** RDS com DR multi-az **Dev** RDS apenas com backup.
- Usar pipeline para deployar infra.
    - Github Actions
- Prover um ambiente base para laboratórios kubernetes.
- O laboratório deve estar documentado e ser replicável
    - Dados sensíveis não devem estar no repositório, documentação deve apontar sua necessidade quando houver.


### Tecnologias usadas:

![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white) ![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white) ![GitHub](https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white) ![GitHub](https://img.shields.io/badge/github-Actions-%23121011.svg?style=for-the-badge&logo=github&logoColor=white) 


### Diagrama de Arquitetura dos Recursos AWS - Ambiente Production

![Diagrama da Arquitetura em PRD](/docs/aws-prd-diagram-admin.png)

### Diagrama Organizations AWS
- Ambientes baseados em multi-account usando aws organizations

![Diagrama Estrutura Organizations](./docs/aws-organizations-diagram.png)

### Gitflow

![Diagrama gitflow](./docs/gitflow-diagram.png)

- Main representando verdade do ambiente prod
    - Usado branch protection
    - implantação via pr com exigência de approve por revisor
    - Apenas no laborátorio foi permitido self-revision, em ambiente real quem submete não aprova.
- Dev representando a verdade do ambiente dev
    - a partir da dev sai as branchs de desenvolvimento.




### Justificativas da abordagem: 

## GitActions
- uso de environment
    - Facilita o gerenciamento e isolamento de ambientes
    - Permite o uso de váriaveis especificas para o ambiente, isso facilita o reaproveitamento de workflows que fazem a mesma coisa para ambientes diferentes.
    - Permite proteger as branchs, ou seja, **somente a branch que representa aquele ambiente implanta recursos**, além de regras mais refinadas.
    - Obrigar o codereview antes de um apply, desde approve simples, até refinados como codeOwner, impedir self-review, impedir admin-bypass.
- Uso de workflow_call
    - Permite reaproveitar um mesmo workflow em diversas lógicas, evitando repetição de código.
- Uso de actions script 
    - Para fazer um resumo do plan e colocar como evidência no pr para facilitar o Review
    - Apontando no PR recursos que sofrerão alterações e dando enfase nos recursos sensíveis, exemplo banco de dados.
- Uso de artifact
    - Para armazenar o plano completo, caso precise de um review mais cuidadoso


## AWS

### Security Groups (SG)
- Pensado na idéia de reduzir superficie de ataque, onde cada SG aceita apenas o trafego necessário.
    - Exemplo: Banco de dados Postgres não precisa abrir portas 22, 3306, 443 etc..
        - Se abre a 5432 é apenas para o SG do recurso que vai consumir o banco.
- Usuário com ponto de entrada apenas pelo LoadBalancer.

| Security Group | Egress Rules               | Ingress Rules                                                                 |
|----------------|----------------------------|-------------------------------------------------------------------------------|
| **All SGs**    | Allow all (0.0.0.0/0)      | -                                                                             |
| **SG-0**       | -                          | Allow 80/443 from 0.0.0.0/0                                                   |
| **SG-01**      | -                          | Allow 22 from restricted-ip<br>Allow 5432 from SG-03                          |
| **SG-02**      | -                          | Allow 22 from SG-01<br>Allow 5432 from SG-03<br>Allow 80/443 from SG-0        |
| **SG-03**      | -                          | Allow 5432 from SG-02<br>Allow 5432 from SG-01                                |


### Organizations
- 


### Documentação de referência

- [Github Actions ](https://docs.github.com/en/actions)
- [Terraform](https://developer.hashicorp.com/terraform/language)
- [Terraform Provider](https://registry.terraform.io/providers/hashicorp/aws/latest)
- [AWS - EKS](https://docs.aws.amazon.com/eks/latest/best-practices/introduction.html)
- [Instâncias RDS ](https://aws.amazon.com/pt/rds/instance-types/)

### Necessário criar policys para EKS controlar seus nós
- Necessário criar a acces-entry para o admin do cluster


### Utils

[LENS - GUI para gerenciar cluster kubernetes](https://k8slens.dev/)

- Adicionar cluster eks ao kubeconfig

```
aws eks update-kubeconfig --region us-east-1 --name <nomeCluster> --alias <ApelidoCluster>
```

- Listar access policies
```
aws eks list-access-entries --cluster-name <NomeCluster>
```
- Listar access entrys 
```
aws eks list-access-entries --cluster-name <NomeCluster>
```
- Verificar o permissionamento de um principal
```
aws eks list-associated-access-policies --cluster-name <NomeCluster> --principal-arn <arnDoPrincipalRetornadoPeloComandoAnterior>
```
- Estrutura de diretórios Terraform
```bash
.
├── modules
│   ├── compute
│   │   ├── access-eks
│   │   ├── eks
│   │   └── vm
│   ├── data
│   │   └── rds
│   └── network
│       ├── igw
│       ├── nat-gateway
│       ├── route
│       ├── route_table
│       ├── rtb_association
│       ├── sg
│       ├── sg-rules
│       ├── subnet
│       └── vpc
├── environments/
│   ├── dev/
│   │   ├── variables.tf
│   │   └── terraform.tfvars
│   └── prod/
│       ├── variables.tf
│       └── terraform.tfvars
├── variables.tf
├── output.tf
└── main.tf
```
