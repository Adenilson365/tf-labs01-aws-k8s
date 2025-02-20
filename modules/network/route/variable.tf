variable "route_table_id" {
  description = "The route table ID"
  type        = string

}

variable "cidr_block" {
  description = "The CIDR block"
  type        = string

}

variable "gateway_id" {
  description = "The gateway ID"
  type        = string

}

variable "default_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default = {
    "Name"       = "default-rt"
    "managed-by" = "terraform"
  }

}

variable "nat_gateway_id" {
  description = "The NAT Gateway ID"
  type        = string
  default     = ""

}