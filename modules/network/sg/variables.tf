variable "vpc_id" {
  description = "The VPC ID"
  type        = string

}

variable "sg_name" {
  description = "The name of the security group"
  type        = string
  default     = "sg-generic"
}

variable "sg_description" {
  description = "The description of the security group"
  type        = string
  default     = "sg-generic"
}

variable "default_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default = {
    "Name"       = "default-sg"
    "managed-by" = "terraform"
  }

}