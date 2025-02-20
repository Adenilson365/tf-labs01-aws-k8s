resource "aws_eks_addon" "vpc_cni" {
  cluster_name = aws_eks_cluster.cluster.name
  addon_name   = "vpc-cni"
  depends_on   = [aws_eks_cluster.cluster]

}

resource "aws_eks_addon" "kube_proxy" {
  cluster_name = aws_eks_cluster.cluster.name
  addon_name   = "kube-proxy"
  depends_on   = [aws_eks_cluster.cluster]

}


