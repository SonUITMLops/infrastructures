variable "name" {}
variable "vpc_cidr" {}
variable "public_subnet_cidrs" {
  type = list(string)
}
variable "private_subnet_cidrs" {
  type = list(string)
}
variable "availability_zones" {
  type = list(string)
}

variable "cluster_name" {}
variable "node_group_name" {}
variable "cluster_iam_role_arn" {}
variable "node_iam_role_arn" {}
