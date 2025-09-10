variable "cluster_name" {
  type        = string
  description = "Name of the EKS cluster"
}

variable "cluster_version" {
  type        = string
  description = "Kubernetes version for the EKS cluster"
}

variable "cluster_role_arn" {
  type        = string
  description = "IAM role ARN for the EKS cluster"
}

variable "private_subnets_ids" {
  type        = list(string)
  description = "List of private subnet IDs"
}

variable "endpoint_private_access" {
  type        = bool
  description = "Enable private endpoint access"
}

variable "endpoint_public_access" {
  type        = bool
  description = "Enable public endpoint access"
}

variable "public_access_cidrs" {
  type        = list(string)
  description = "List of CIDRs allowed for public endpoint access"
}

variable "enabled_cluster_log_types" {
  type        = list(string)
  description = "Types of logs to enable for EKS cluster"
}

variable "tags" {
  type        = map(string)
  description = "Tags for the EKS cluster"
}


variable "aws_region" {
  type        = string
  description = "AWS region"
}

variable "node_group_role_arn" {
  type        = string
  description = "IAM role ARN for the EKS node group"
}

variable "node_group_desired" {
  type        = number
  description = "Desired size of the node group"
}

variable "node_group_min" {
  type        = number
  description = "Minimum size of the node group"
}

variable "node_group_max" {
  type        = number
  description = "Maximum size of the node group"
}

variable "ami_type" {
  type        = string
  description = "AMI type for the node group"
}

variable "node_group_instance_types" {
  type        = list(string)
  description = "List of instance types for the node group"
}

variable "ec2_ssh_key" {
  type        = string
  description = "EC2 SSH key name"
}

variable "node_group_tags" {
  type        = map(string)
  description = "Tags for the node group"
}