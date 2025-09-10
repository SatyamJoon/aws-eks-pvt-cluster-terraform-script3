# Cluster & Node role names
variable "cluster_name" {}

# IAM Policy Lists
variable "eks_cluster_policies" {
  type = list(string)
}

variable "eks_node_policies" {
  type = list(string)
}