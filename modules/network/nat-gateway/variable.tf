variable "connectivity_type" {
  description = "The type of connectivity for the NAT Gateway. Valid values are public or private."
  type        = string
  default     = "public"
}

variable "subnet_id" {
  description = "The ID of the subnet in which to place the NAT Gateway."
  type        = string
}

variable "default_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default = {
    "Name"       = "default-nat"
    "managed-by" = "TF"
  }

}