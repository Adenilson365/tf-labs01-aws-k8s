resource "aws_security_group_rule" "rule" {
  type              = var.type_rule
  from_port         = var.from_port
  to_port           = var.to_port
  protocol          = var.protocol
  security_group_id = var.security_group_id

  cidr_blocks              = length(var.cidr_blocks) > 0 ? var.cidr_blocks : null
  source_security_group_id = var.source_security_group_id != null ? var.source_security_group_id : null

}
