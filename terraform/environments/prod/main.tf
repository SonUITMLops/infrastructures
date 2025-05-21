module "eks" {
  source         = "C:/Users/MY PC/Desktop/infrastructures/terraform/modules/eks"
  cluster_name   = "cluster"
  node_group_name = "node-group"
  cluster_iam_role_arn  = "arn:aws:iam::975049964252:role/eks-cluster-role"
  node_iam_role_arn    ="arn:aws:iam::975049964252:role/aws-service-role/eks-nodegroup.amazonaws.com/AWSServiceRoleForAmazonEKSNodegroup"
  subnet_ids     = ["subnet-0fbb6a60d244b1ac9","subnet-074f02343b3de2d27"]
  
}

output "test_cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "test_cluster_ca_data" {
  value = module.eks.cluster_ca_data
}

