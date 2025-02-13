resource aws_db_subnet_group "rds_subnet_group" {
  subnet_ids = var.subnet_ids
  tags = merge(var.default_tags, { "Name" = "rds-subnet-group" })
}

resource "aws_db_instance" "db" {
  allocated_storage = var.allocated_storage
    engine = var.engine
    engine_version = var.engine_version
    instance_class = var.instance_class
    db_name = var.db_name
    username = var.username
    password = var.password
    db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.name
    vpc_security_group_ids = var.vpc_security_group_ids
    tags = var.default_tags
    backup_retention_period = var.backup_retention_period
    multi_az = var.multi_az
    publicly_accessible = var.publicly_accessible
    skip_final_snapshot = var.skip_final_snapshot
    identifier = var.identifier
}