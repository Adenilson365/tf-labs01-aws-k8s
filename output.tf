output "pbc_subnet_ids" {
  value = module.public_subnet[*].subnet_id
}

output "pbc_subnet_azs" {
  value = module.public_subnet[*].subnet_az
}

output "pvt_subnet_ids" {
  value = module.private_subnet[*].subnet_id
}

output "pvt_subnet_azs" {
  value = module.private_subnet[*].subnet_az
}

output "igw_id" {
  value = module.igw.igw_id

}

# output "instance_ip" {
#   value = module.vm[*].ec2-ip
# }

output "security_group_ids" {
  value = module.sg[*].sg_id
}

#Output for RDS

output "rds_endpoint" {
  value = module.rds.endpoint
}

output "rds_username" {
  value = module.rds.username
}

output "rds_password" {
  value = module.rds.password
  sensitive = true
}

