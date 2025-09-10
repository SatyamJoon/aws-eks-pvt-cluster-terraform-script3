variable "vpc_id" {
  type        = string
  description = "VPC ID where endpoints are created"
}

variable "aws_region" {
  type        = string
  description = "AWS region"
}

variable "cluster_name" {
  type        = string
  description = "Cluster name for tagging"
}

variable "s3_service_name" {
  type        = string
  description = "Service name for S3 endpoint"
}

variable "s3_vpc_endpoint_type" {
  type        = string
  description = "Type of VPC endpoint for S3"
}

variable "route_table_private_id" {
  type        = string
  description = "Route table ID for private subnets"
}

variable "route_table_public_id" {
  type        = string
  description = "Route table ID for public subnets"
}

variable "interface_endpoints" {
  type        = list(string)
  description = "List of interface endpoints to create"
}

variable "endpoints_sg_name" {
  type        = string
  description = "Name of the security group for endpoints"
}

variable "endpoints_sg_description" {
  type        = string
  description = "Description of the security group for endpoints"
}

variable "ingress_from_port" {
  type        = number
  description = "Ingress rule from port"
}

variable "ingress_to_port" {
  type        = number
  description = "Ingress rule to port"
}

variable "ingress_protocol" {
  type        = string
  description = "Protocol for ingress rule"
}

variable "ingress_cidr_blocks" {
  type        = list(string)
  description = "CIDR blocks allowed for ingress"
}

variable "egress_from_port" {
  type        = number
  description = "Egress rule from port"
}

variable "egress_to_port" {
  type        = number
  description = "Egress rule to port"
}

variable "egress_protocol" {
  type        = string
  description = "Protocol for egress rule"
}

variable "egress_cidr_blocks" {
  type        = list(string)
  description = "CIDR blocks allowed for egress"
}

variable "private_subnets_ids" {
  type        = list(string)
  description = "List of private subnet IDs"
}

variable "interface_vpc_endpoint_type" {
  type        = string
  description = "Type of VPC endpoint for interface endpoints"
}

variable "private_dns_enabled" {
  type        = bool
  description = "Whether private DNS is enabled"
}