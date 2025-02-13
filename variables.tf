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

variable "db_username" {
  description = "The username to use for the database"
  type        = string
  
}

variable "db_password" {
  description = "The password to use for the database"
  type        = string
  
}

