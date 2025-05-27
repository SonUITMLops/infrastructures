# VPC vars
name                = "eks"
vpc_cidr            = "10.0.0.0/16"
public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.11.0/24", "10.0.12.0/24"]
availability_zones  = ["us-east-1a", "us-east-1b"]

# EKS vars
cluster_name         = "cluster"
node_group_name      = "node-group"
cluster_iam_role_arn = "arn:aws:iam::339712932793:role/eks-cluster-role"
node_iam_role_arn    = "arn:aws:iam::339712932793:role/node-group"
