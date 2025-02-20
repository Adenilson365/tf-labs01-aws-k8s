variable "default_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default = {
    "Name"       = "vm"
    "managed-by" = "terraform"
  }

}

variable "instance_type" {
  description = "The instance type"
  type        = string
}

variable "key_name" {
  description = "The key name"
  type        = string

}

variable "subnet_id" {
  description = "The subnet ID"
  type        = string

}

variable "security_group_ids" {
  description = "The security group IDs"
  type        = list(string)

}