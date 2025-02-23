#vm vars
vm_count      = 0
instance_type = "t2.micro"


#RDS vars
rds_instance_class = "db.t4g.micro"
engine_version     = "14.15"
db_password        = "Admin123"
db_username        = "postgres"
db_name            = "mydbdev"
identifier         = "mydbpsql"
allocated_storage  = 20
engine             = "postgres"



#EKS vars
node_group_name = "eks-node-group"
instance_types  = ["t2.micro"]
desired_size    = 3
max_size        = 15
min_size        = 3
eks_version     = "1.32"
eks_name        = "eks-cluster-dev"

#Access EKS vars
#Listar acces policies -> aws eks list-access-policies --output table
#Crie a var de ambiente: export TF_VAR_aws_profile="arn:aws:iam::<accNumber>:<user>"
cluster_name  = "eks-cluster"
type          = "STANDARD"
policy_arn    = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
scope_type    = "cluster"
namespaces    = null