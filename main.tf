

module "vpc" {
  source         = "./modules/network/vpc"
  vpc_cidr_block = "10.0.0.0/22"
  default_tags = {
    "Name"       = "devopslabs-vpc",
    "managed-by" = "TF"
  }
}

module "public_subnet" {
  source            = "./modules/network/subnet"
  vpc_id            = module.vpc.vpc_id
  cidr_block        = var.public_subnet_cidr_block[count.index]
  availability_zone = var.availability_zones[count.index]
  enabled_public_ip = true
  count             = 2
  default_tags = {
    "Name"       = "pbc-sb-${count.index}",
    "managed-by" = "TF"
  }
}


module "private_subnet" {
  source            = "./modules/network/subnet"
  vpc_id            = module.vpc.vpc_id
  cidr_block        = var.private_subnet_cidr_block[count.index]
  availability_zone = var.availability_zones[count.index]
  count             = 2
  default_tags = {
    "Name"       = "prv-sb-${count.index}",
    "managed-by" = "TF"
  }

}

# module "vm" {
#   source = "./modules/compute/vm"
#   instance_type = "t3.small"
#   key_name = "kp-linux"
#   subnet_id = module.public_subnet[0].subnet_id
#   security_group_ids = [module.sg[count.index].sg_id]
#   default_tags = {
#     "Name"       = "vm-${count.index}",
#     "managed-by" = "TF"
#   }
#   depends_on = [ module.public_subnet, module.sg ]
#   count = 2
# }


module "igw" {
  source = "./modules/network/igw"
  vpc_id = module.vpc.vpc_id
  default_tags = {
    "Name"       = "devopslabs-igw",
    "managed-by" = "TF"
  }
}

module "nat_gateway" {
  source = "./modules/network/nat-gateway"
  connectivity_type = "public"
  subnet_id = module.public_subnet[0].subnet_id
  default_tags = {
    "Name"       = "devopslabs-nat",
    "managed-by" = "TF"
  }
  depends_on = [ module.igw, module.public_subnet ]
  
}

module "route_table" {
  source = "./modules/network/route_table"
  vpc_id = module.vpc.vpc_id
  default_tags = {
    "Name"       = "devopslabs-${each.key}",
    "managed-by" = "TF"
  }
  for_each = var.route_tables
  depends_on = [ module.vpc ]
}

//module.route_table["rtb-public"].aws_route_table.rtb
module "route" {
  source = "./modules/network/route"
  gateway_id =  module.igw.igw_id
  route_table_id = module.route_table["rtb-public"].route_table_id
  cidr_block = "0.0.0.0/0"  
  default_tags = {
    "Name"       = "devopslabs-route",
    "managed-by" = "TF"
  }
  depends_on = [ module.igw, module.route_table ]

}

module "route_nat" {
  source = "./modules/network/route"
  gateway_id =  module.nat_gateway.nat_gateway_id
  route_table_id = module.route_table["rtb-private"].route_table_id
  cidr_block = "0.0.0.0/0"  
  default_tags = {
    "Name"       = "devopslabs-route",
    "managed-by" = "TF"
  }
  depends_on = [ module.igw, module.route_table, module.nat_gateway ]

}




#route table association
module "rtb_association" {
  source = "./modules/network/rtb_association"
  route_table_id = module.route_table["rtb-public"].route_table_id
  subnet_id = module.public_subnet[count.index].subnet_id
  depends_on = [ module.route_table, module.public_subnet ]

  count = 2
}

module "rtb_association_private" {
  source = "./modules/network/rtb_association"
  route_table_id = module.route_table["rtb-private"].route_table_id
  subnet_id = module.private_subnet[count.index].subnet_id
  depends_on = [ module.route_table, module.public_subnet ]

  count = 2
}




#Securitys


module "sg" {
  source = "./modules/network/sg"
  vpc_id = module.vpc.vpc_id
  sg_name = "security-${count.index}"
  sg_description = "sg-${count.index}"
  default_tags = {
    "Name"       = "security-${count.index}",
    "managed-by" = "TF"
  }
  count = 4
}


#Rules sg0
module "sg_rules-ingress" {
  source = "./modules/network/sg-rules"
  security_group_id = module.sg[0].sg_id
  type_rule = "ingress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  cidr_blocks  = ["0.0.0.0/0"]
  source_security_group_id = null
  depends_on = [ module.sg ]
}


module "sg_rules-ingress-http" {
  source = "./modules/network/sg-rules"
  security_group_id = module.sg[0].sg_id
  type_rule = "ingress"
  from_port = 80
  to_port = 80
  protocol = "tcp"
  cidr_blocks  = ["0.0.0.0/0"]
  source_security_group_id = null
  depends_on = [ module.sg ]
}

module "sg_rules-egress" {
  source = "./modules/network/sg-rules"
  security_group_id = module.sg[0].sg_id
  type_rule = "egress"
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks  = ["0.0.0.0/0"]
  source_security_group_id = null
  depends_on = [ module.sg ]
}

#Rules sg1
module "sg_rules-ingress-sg1" {
  source = "./modules/network/sg-rules"
  security_group_id = module.sg[1].sg_id
  type_rule = "ingress"
  from_port = 80
  to_port = 80
  protocol = "tcp"
  cidr_blocks  = []
  source_security_group_id = module.sg[0].sg_id

  depends_on = [ module.sg ]
}


module "sg_rules-ssh-sg1" {
  source = "./modules/network/sg-rules"
  security_group_id = module.sg[1].sg_id
  type_rule = "ingress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  cidr_blocks  =  ["0.0.0.0/0"]
  source_security_group_id = null

  depends_on = [ module.sg ]
}

module "sg_rules-egress-sg1" {
  source = "./modules/network/sg-rules"
  security_group_id = module.sg[1].sg_id
  type_rule = "egress"
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks  = ["0.0.0.0/0"]
    source_security_group_id = null
  depends_on = [ module.sg ]
}


