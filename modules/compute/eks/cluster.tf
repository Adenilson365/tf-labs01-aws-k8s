resource "aws_eks_cluster" "cluster" {
  name = var.eks_name

  access_config {
    authentication_mode = var.authentication_mode
  }

  role_arn = aws_iam_role.cluster_iam.arn
  version  = var.eks_version

  vpc_config {
    subnet_ids         = var.eks_subnet_ids
    security_group_ids = var.security_group_ids

  }

  depends_on = [
    aws_iam_role_policy_attachment.cluster_AmazonEKSClusterPolicy,
  ]

  tags = var.default_tags
}