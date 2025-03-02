profile     = "dev"
region      = "us-east-1"
backend_key = "tf-state-dev"

#vm vars
vm_count      = 1
instance_type = "t3.small"


#RDS vars
rds_instance_class      = "db.t4g.micro"
engine_version          = "14.15"
db_name                 = "mydbdev"
identifier              = "mydbpsqldev"
allocated_storage       = 20
engine                  = "postgres"
backup_retention_period = 0
multi_az                = false
publicly_accessible     = false
skip_final_snapshot     = true



#EKS vars
node_group_name = "eks-node-group"
instance_types  = ["t2.micro"]
desired_size    = 2
max_size        = 15
min_size        = 2
eks_version     = "1.32"
eks_name        = "eks-cluster-dev"

#Access EKS vars
#Listar acces policies -> aws eks list-access-policies --output table
#Crie a var de ambiente: export TF_VAR_aws_profile="arn:aws:iam::<accNumber>:<user>"
cluster_name = "eks-cluster"
type         = "STANDARD"
policy_arn   = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
scope_type   = "cluster"
namespaces   = null