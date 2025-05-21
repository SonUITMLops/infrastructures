module "eks" {
  source         = "git::https://github.com/DevOpsOrganization2025/infrastructures.git//terraform/modules/eks?ref=main"
  cluster_name   = "cluster"
  node_group_name = "node-group"
  cluster_iam_role_arn  = "arn:aws:iam::423623850991:role/eks-cluster-role"
  node_iam_role_arn    ="arn:aws:iam::423623850991:role/eks-node-group-role"
  subnet_ids     = ["subnet-092f3cb9cd7352383","subnet-0cc19f52319fac8f9"]
  
}

output "test_cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "test_cluster_ca_data" {
  value = module.eks.cluster_ca_data
}

