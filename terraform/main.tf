# Tạo VPC trước
module "vpc" {
  source = "./modules/vpc"

  name                = var.name
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones  = var.availability_zones
}

# Tạo EKS sau khi VPC có subnet
module "eks" {
    source = "./modules/eks"
    cluster_name       = var.cluster_name
    node_group_name    = var.node_group_name
    cluster_iam_role_arn = var.cluster_iam_role_arn
    node_iam_role_arn    = var.node_iam_role_arn

  # Dùng subnet từ output của module VPC
    subnet_ids = module.vpc.private_subnet_ids
    instance_type = ["t3.small"]
 
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "eks_endpoint" {
  value = module.eks.cluster_endpoint
}

output "eks_ca_data" {
  value = module.eks.cluster_ca_data
}
