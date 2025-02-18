variable "default_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default = {
    "Name"       = "default-db"
    "managed-by" = "terraform"
  }

}

variable "subnet_ids" {
  description = "The ID of the VPC"
  type        = list(string)
}

variable "allocated_storage" {
  description = "The amount of storage to allocate to the database, in gigabytes, but only numbers are allowed"
  type        = number

}

variable "engine" {
  description = "The database engine to use - Example: mysql"
  type        = string
}

variable "engine_version" {
  description = "The version of the database engine to use"
  type        = string
}

variable "instance_class" {
  description = "The instance class to use"
  type        = string
}

variable "db_name" {
  description = "The name of the database"
  type        = string
}

variable "username" {
  description = "The username to use for the database"
  type        = string
}

variable "password" {
  description = "The password to use for the database"
  type        = string
}

variable "vpc_security_group_ids" {
  description = "The security group to use for the database"
  type        = list(string)
}

variable "backup_retention_period" {
  description = "The number of days to retain backups for"
  type        = number
  default     = 0
}

variable "multi_az" {
  description = "Whether to use multi-az"
  type        = bool
  default     = false
}

variable "publicly_accessible" {
  description = "Whether the database should be publicly accessible"
  type        = bool
  default     = false
}

variable "skip_final_snapshot" {
  description = "Whether to skip the final snapshot"
  type        = bool
  default     = true
}

variable "identifier" {
  description = "The identifier for the database"
  type        = string
}