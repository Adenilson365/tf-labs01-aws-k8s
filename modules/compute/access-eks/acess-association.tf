resource "aws_eks_access_policy_association" "example" {
  cluster_name  = var.cluster_name
  policy_arn    = var.policy_arn
  principal_arn = var.principal_arn

  access_scope {
    type       = var.scope_type
    namespaces = var.namespaces != null ? var.namespaces : []

  }
}

