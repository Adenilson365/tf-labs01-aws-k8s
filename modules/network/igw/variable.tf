variable "default_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default = {
    "Name"       = "default-igw"
    "managed-by" = "terraform"
  }

}


variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

