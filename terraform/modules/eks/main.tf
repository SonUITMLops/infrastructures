provider "aws" {
  region = "us-east-1"
}
resource "aws_eks_cluster" "cluster" {
  name     = var.cluster_name
  role_arn = var.cluster_iam_role_arn 

  vpc_config {
    subnet_ids = var.subnet_ids
  }

  version = "1.31"
}

resource "aws_eks_node_group" "node_group" {
  cluster_name    = var.cluster_name
  node_group_name = var.node_group_name
  node_role_arn   = var.node_iam_role_arn 
  subnet_ids      = var.subnet_ids
  instance_type   =var.instance_type
  scaling_config {
    desired_size = 2
    max_size     = 4
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }

  depends_on = [aws_eks_cluster.cluster]
}

resource "aws_eks_addon" "coredns" {
  cluster_name = var.cluster_name
  addon_name   = "coredns"
 
  depends_on   = [aws_eks_cluster.cluster]
}

resource "aws_eks_addon" "kube_proxy" {
  cluster_name = var.cluster_name
  addon_name   = "kube-proxy"
 
  depends_on   = [aws_eks_cluster.cluster]
}

resource "aws_eks_addon" "vpc_cni" {
  cluster_name = var.cluster_name
  addon_name   = "vpc-cni"
  
  depends_on   = [aws_eks_cluster.cluster]
}

resource "aws_eks_addon" "eks_pod_identity_agent" {
  cluster_name = var.cluster_name
  addon_name   = "eks-pod-identity-agent"
  
  depends_on   = [aws_eks_cluster.cluster]
}

