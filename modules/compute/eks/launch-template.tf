
resource "aws_launch_template" "eks_worker_lt" {
  name_prefix   = "eks-worker"
  key_name      = var.key_name     
  vpc_security_group_ids = var.security_group_ids_to_nodegroup  

  tag_specifications {
    resource_type = "instance"
    tags= merge(var.default_tags, {Name = "eks-worker"})
  }
}
