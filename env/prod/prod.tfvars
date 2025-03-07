profile     = "prd"
region      = "us-east-1"
backend_key = "tf-state-prod"

#vm vars
vm_count      = 1
instance_type = "t2.micro"


#RDS vars
rds_instance_class      = "db.t4g.micro"
engine_version          = "14.15"
db_name                 = "mydbprd"
identifier              = "mydbpsqlprd"
allocated_storage       = 20
engine                  = "postgres"
backup_retention_period = 1
multi_az                = true
publicly_accessible     = false
skip_final_snapshot     = true



#EKS vars
node_group_name = "eks-node-group"
instance_types  = ["t3.medium"]
desired_size    = 1
max_size        = 10
min_size        = 1
eks_version     = "1.32"
eks_name        = "eks-cluster-prod"

#Access EKS vars
#Listar acces policies -> aws eks list-access-policies --output table
#Crie a var de ambiente: export TF_VAR_aws_profile="arn:aws:iam::<accNumber>:<user>"
cluster_name = "eks-cluster"
type         = "STANDARD"
policy_arn   = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
scope_type   = "cluster"
namespaces   = null