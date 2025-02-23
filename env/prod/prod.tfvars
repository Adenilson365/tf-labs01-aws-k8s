#vm vars
vm_count      = 0
instance_type = "t3.small"


#RDS vars
rds_instance_class = "db.t4g.micro"
engine_version     = "14.15"
db_password        = "Admin123"
db_username        = "postgres"
db_name            = "mydb"
identifier         = "mydbpsql"
allocated_storage  = 20
engine             = "postgres"



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
cluster_name  = "eks-cluster"
type          = "STANDARD"
policy_arn    = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
scope_type    = "cluster"
namespaces    = null