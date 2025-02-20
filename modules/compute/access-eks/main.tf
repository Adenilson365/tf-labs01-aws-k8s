resource "aws_eks_access_entry" "example" {
  cluster_name  = var.cluster_name
  principal_arn = var.principal_arn
  type          = var.type
}