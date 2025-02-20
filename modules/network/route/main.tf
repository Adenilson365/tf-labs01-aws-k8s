resource "aws_route" "route" {
  route_table_id         = var.route_table_id
  destination_cidr_block = var.cidr_block
  gateway_id             = var.gateway_id != "" ? var.gateway_id : null
  nat_gateway_id         = var.nat_gateway_id != "" ? var.nat_gateway_id : null
}

