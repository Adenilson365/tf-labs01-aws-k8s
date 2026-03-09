variable "profile" {}
variable "region" {}
variable "backend_key" {}
variable "public_subnet_cidr_block" {}
variable "private_subnet_cidr_block" {}
variable "availability_zones" {}
variable "route_tables" {}
#Vm Variables
variable "vm_count" {}
variable "instance_type" {}
variable "key_name" {}
##RDS Variables
variable "rds_instance_class" {}
variable "engine_version" {}
variable "db_name" {}
variable "identifier" {}
variable "allocated_storage" {}
variable "engine" {}
variable "db_username" {}
variable "db_password" {}
variable "backup_retention_period" {}
variable "multi_az" {}
variable "publicly_accessible" {}
variable "skip_final_snapshot" {}

#EKS Variables
variable "node_group_name" {}
variable "instance_types" {}
variable "desired_size" {}
variable "max_size" {}
variable "min_size" {}

variable "eks_name" {}
variable "eks_version" {}
variable "authentication_mode" {}
# Var for Access EKS
variable "cluster_name" {}
variable "principal_arn" {}
variable "type" {}
variable "policy_arn" {}
variable "scope_type" {}
variable "namespaces" {}

#s3 Variables
variable "bucket_name" {}
variable "block_public_acls" {}
variable "block_public_policy" {}
variable "ignore_public_acls" {}
variable "restrict_public_buckets" {}
variable "versioning" {}

