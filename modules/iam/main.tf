# IAM Role for EKS Cluster
resource "aws_iam_role" "eks_cluster" {
  name               = "${var.cluster_name}-cluster-role-ankita"
  assume_role_policy = data.aws_iam_policy_document.eks_assume_role.json

  tags = {
    Name = "${var.cluster_name}-cluster-role"
  }
}

data "aws_iam_policy_document" "eks_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["eks.amazonaws.com"]
    }
  }
}

# Attach EKS Cluster Policies (dynamic)
resource "aws_iam_role_policy_attachment" "eks_cluster_policies" {
  for_each   = toset(var.eks_cluster_policies)
  role       = aws_iam_role.eks_cluster.name
  policy_arn = each.value
}

# IAM Role for Node Group
resource "aws_iam_role" "node_group" {
  name               = "${var.cluster_name}-node-role-ankita"
  assume_role_policy = data.aws_iam_policy_document.node_assume_role.json

  tags = {
    Name = "${var.cluster_name}-node-role"
  }
}

data "aws_iam_policy_document" "node_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

# Attach Node Group Policies (dynamic)
resource "aws_iam_role_policy_attachment" "eks_node_policies" {
  for_each   = toset(var.eks_node_policies)
  role       = aws_iam_role.node_group.name
  policy_arn = each.value
}