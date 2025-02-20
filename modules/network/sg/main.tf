resource "aws_security_group" "sg" {
  name        = var.sg_name
  description = var.sg_description
  vpc_id      = var.vpc_id
  tags        = var.default_tags
}