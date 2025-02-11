resource "aws_nat_gateway" "nat" {
    allocation_id = aws_eip.ip_fixo.id
  subnet_id     = var.subnet_id
  connectivity_type = var.connectivity_type
tags = var.default_tags

}

resource "aws_eip" "ip_fixo" {
    domain = "vpc"
  tags = var.default_tags
}