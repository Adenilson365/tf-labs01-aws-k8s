variable "type_rule" {
  description = "The type of rule"
  type        = string
}

variable "from_port" {
  description = "The from port"
  type        = number
}

variable "to_port" {
  description = "The to port"
  type        = number
}

variable "protocol" {
  description = "The protocol"
  type        = string
}

variable "security_group_id" {
  description = "The security group ID"
  type        = string
}

variable "cidr_blocks" {
  description = "The prefix list IDs"
  type        = list(string)

}

variable "source_security_group_id" {
  description = "The source security group ID"
  type        = string
}