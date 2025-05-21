variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}
variable "name" {
  description = "Prefix name for resources"
  type        = string
}
variable "public_subnet_cidrs" {
  type = list(string)
}
variable "private_subnet_cidrs" {
  type = list(string)
}
variable "availability_zones" {
  type = list(string)
}
