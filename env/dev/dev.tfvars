profile     = "dev"
region      = "us-east-1"
backend_key = "tf-state-dev"

#VPC vars
public_subnet_cidr_block  = ["10.0.0.0/24", "10.0.1.0/24"]
private_subnet_cidr_block = ["10.0.2.0/24", "10.0.3.0/24"]
availability_zones        = ["us-east-1a", "us-east-1b"]
route_tables              = ["rtb-public", "rtb-private"]

#vm vars
vm_count      = 1
instance_type = "t2.micro"


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
instance_types  = ["t3.small"]
desired_size    = 2
max_size        = 15
min_size        = 2
eks_version     = "1.34"
eks_name        = "eks-cluster-dev"


#Access EKS vars
#Listar acces policies -> aws eks list-access-policies --output table
#Crie a var de ambiente: export TF_VAR_aws_profile="arn:aws:iam::<accNumber>:<user>"
cluster_name = "eks-cluster"
type         = "STANDARD"
policy_arn   = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
scope_type   = "cluster"
namespaces   = null

#s3 vars
bucket_name             = "knz-dev-bucket"
block_public_acls       = true
block_public_policy     = true
ignore_public_acls      = true
restrict_public_buckets = true
versioning              = true
