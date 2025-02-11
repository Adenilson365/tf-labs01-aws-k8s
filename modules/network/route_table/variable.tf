variable "vpc_id" {
  description = "The VPC ID"
  type        = string

}
variable "default_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default = {
    "Name"       = "default-rtb"
    "managed-by" = "terraform"
  }

}