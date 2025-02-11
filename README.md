### Objetivos
- Prática de IAC com Terraform e Cloud AWS.
- Prover RemoteState, StateLock.
- Usar pipeline para deployar infra.
- Prover um ambiente base para laboratórios kubernetes.
- O laboratório deve estar documentado e ser replicável
    - Dados sensíveis não devem estar no repositório, documentação deve apontar sua necessidade quando houver.



![Estágio Atual](/docs/atual.png)

## Security Groups
- Egress full allow 0.0.0.0/0
### SG-0
- Ingress 80/443 full allow 0.0.0.0/0
### SG-01
- Ingress 22 MyIp 
### SG-02
- Ingress 22 from SG-01
- Ingress 5432 from SG-01
### SG-03
- Ingress 5432 from SG-02
- Ingress 5432 from SG-01



### Links provider
- [VPC](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc)
- [Subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet)
- [IGW](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway)
- [IGW - Attach](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway_attachment)
- [Nat Gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway)

- [Route Table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table)
- [Security Group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group)


- [Roles IAM para EKS](https://docs.aws.amazon.com/eks/latest/userguide/cluster-iam-role.html)
- [EKS add-ons](https://docs.aws.amazon.com/eks/latest/userguide/workloads-add-ons-available-eks.html)