variable "profile" {
  type = string
}

variable "region" {
  type = string
}

variable "backend_key" {
  type = string
}

variable "public_subnet_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = list(string)
  default     = ["10.0.0.0/24", "10.0.1.0/24"]
}


variable "private_subnet_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = list(string)
  default     = ["10.0.2.0/24", "10.0.3.0/24"]
}


variable "availability_zones" {
  description = "A list of availability zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]

}


variable "route_tables" {
  description = "Generate name for route tables"
  type        = set(string)
  default     = ["rtb-public", "rtb-private"]
}

#Vm Variables

variable "vm_count" {
  description = "The ID of the AMI to use for the instance"
  type        = number
  default     = 0
}

variable "instance_type" {
  description = "The type of instance to launch"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "The name of the key pair to use for the instance"
  type        = string
}


##RDS Variables

variable "rds_instance_class" {
  description = "The instance class to use"
  type        = string
  default     = "db.t4g.micro"
}

variable "engine_version" {
  description = "The version of the database engine to use, use comand: aws rds describe-db-engine-versions --engine postgres --query 'DBEngineVersions[*].EngineVersion'"
  type        = string
  default     = "14.15"

}

variable "db_name" {
  description = "The name of the database to create"
  type        = string

}

variable "identifier" {
  description = "The name of the RDS instance"
  type        = string

}

variable "allocated_storage" {
  description = "The amount of storage to allocate"
  type        = number

}

variable "engine" {
  description = "The database engine to use"
  type        = string

}

variable "db_username" {
  description = "The username to use for the database"
  type        = string

}

variable "db_password" {
  description = "The password to use for the database"
  type        = string

}

#EKS Variables

variable "node_group_name" {
  description = "The name of the node group"
  type        = string

}

variable "instance_types" {
  description = "The instance types to use for the node group"
  type        = list(string)
}

variable "desired_size" {
  description = "The desired number of worker nodes"
  type        = number
}

variable "max_size" {
  description = "The maximum number of worker nodes"
  type        = number
}

variable "min_size" {
  description = "The minimum number of worker nodes"
  type        = number
}

# variable "pvt_subnet_ids" {
#   description = "The private subnet IDs to launch the worker nodes into"
#   type        = list(string)

# }

#EKS Cluster

# variable "eks_subnet_ids" {
#   description = "The subnet IDs to launch the EKS cluster into"
#   type        = list(string)
# }

variable "eks_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "eks_version" {
  description = "The Kubernetes version for the EKS cluster"
  type        = string
}

variable "authentication_mode" {
  description = "The authentication mode for the EKS cluster"
  type        = string
  default     = "API"
}

# Var for Access EKS

variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string

}

variable "principal_arn" {
  description = "The ARN of the principal to allow access to the EKS cluster"
  type        = string
}

variable "type" {
  description = "The type of access to allow to the EKS cluster"
  type        = string
}

variable "policy_arn" {
  description = "The ARN of the policy to attach to the EKS cluster"
  type        = string

}

variable "scope_type" {
  description = "The type of access scope to allow to the EKS cluster"
  type        = string
}


variable "namespaces" {
  description = "The namespaces to allow access to the EKS cluster"
  type        = list(string)
}