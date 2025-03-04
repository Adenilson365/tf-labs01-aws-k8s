### Localmente
- Clone o repositório
- cd ./labs01-k8s
- configure seu profile AWS 
- [Como configurar aws-cli](https://docs.aws.amazon.com/pt_br/cli/latest/userguide/getting-started-quickstart.html)
- [Como configurar remotestate e statelock - Terraform Docs](https://developer.hashicorp.com/terraform/language/backend/s3) 
- [Como configurar remotestate e statelock - Medium](https://quileswest.medium.com/how-to-lock-terraform-state-with-s3-bucket-in-dynamodb-3ba7c4e637)

- exporte as variáveis de ambiente:
```bash
export TF_VAR_aws_profile="arn:aws:iam::<ID_sua_Conta_AWS>:user/<userContaAWS>"
export TF_VAR_principal_arn="arn:aws:iam::<ID_sua_Conta_AWS>:user/<userContaAWS>"
export TF_VAR_db_password="<SenhaBancoDados>"
export TF_VAR_db_username="<UserNameBancoDeDados>"
export TF_VAR_key_name="<NomeSuaKeyParAWS>"

```
- Terraform init
```bash
terraform init -reconfigure  \
 -backend-config="bucket=<NomeDoSeuBucketRemoteState>" \
 -backend-config="key=<NomeSeuRemoteState>" \
 -backend-config="dynamodb_table=<NomeDaSuaTabelaDynamoDB>"   \
 -backend-config="region=<regiom>" \
 -backend-config="profile=<apelidoSeuprofile>"
```

```bash
terraform plan -var-file ./env/dev/dev.tfvars
terraform apply -var-file ./env/dev/dev.tfvars
```


