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