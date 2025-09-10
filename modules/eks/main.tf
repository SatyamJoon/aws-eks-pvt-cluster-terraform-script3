resource "aws_eks_cluster" "this" {
  name     = var.cluster_name
  version  = var.cluster_version
  role_arn = var.cluster_role_arn

  vpc_config {
    subnet_ids              = var.private_subnets_ids
    endpoint_private_access = var.endpoint_private_access
    endpoint_public_access  = var.endpoint_public_access
    public_access_cidrs    = var.public_access_cidrs
  }

  enabled_cluster_log_types = var.enabled_cluster_log_types

  tags = var.tags

  #depends_on = var.cluster_role_dependencies
}

# resource "local_file" "kubeconfig" {
#   content = templatefile("${path.module}/../../templates/kubeconfig.tpl", {
#     cluster_name     = aws_eks_cluster.this.name
#     cluster_endpoint = aws_eks_cluster.this.endpoint
#     ca_data          = aws_eks_cluster.this.certificate_authority[0].data
#     region           = var.aws_region
#   })
#   filename = "${path.module}/../../kubeconfig_${var.cluster_name}"
# }


resource "aws_eks_node_group" "managed_nodes" {
  cluster_name    = aws_eks_cluster.this.name
  node_group_name = "${var.cluster_name}-ng"
  node_role_arn   = var.node_group_role_arn
  subnet_ids      = var.private_subnets_ids

  scaling_config {
    desired_size = var.node_group_desired
    min_size     = var.node_group_min
    max_size     = var.node_group_max
  }

  ami_type       = var.ami_type
  instance_types = var.node_group_instance_types

  remote_access {
    ec2_ssh_key = var.ec2_ssh_key
  }

  tags = var.node_group_tags

  depends_on = [aws_eks_cluster.this]
}