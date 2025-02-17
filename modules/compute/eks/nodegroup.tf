resource "aws_eks_node_group" "node_group" {
  cluster_name    = aws_eks_cluster.cluster.name
  node_group_name = var.node_group_name
  node_role_arn   = aws_iam_role.node_iam.arn
  subnet_ids      = var.pvt_subnet_ids
  instance_types  = var.instance_types
  scaling_config {
    desired_size = var.desired_size
    max_size     = var.max_size
    min_size     = var.min_size
  }

  tags = var.default_tags

  depends_on = [ aws_iam_role_policy_attachment.node_AmazonEC2ContainerRegistryPullOnly,
                 aws_iam_role_policy_attachment.node_AmazonEKSWorkerNodeMinimalPolicy,
                 aws_eks_cluster.cluster ]
}