
variable "cluster_name" {
  type        = string
  description = "Cluster name used for tagging resources"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "public_subnets_cidrs" {
  type        = list(string)
  description = "List of CIDR blocks for public subnets"
}

variable "private_subnets_cidrs" {
  type        = list(string)
  description = "List of CIDR blocks for private subnets"
}

variable "availability_zones" {
  type        = list(string)
  description = "List of availability zones to use"
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "Enable DNS hostnames for the VPC"
}

variable "enable_dns_support" {
  type        = bool
  description = "Enable DNS support for the VPC"
}

variable "public_route_cidr" {
  type        = string
  description = "CIDR block for public route"
}

variable "private_route_cidr" {
  type        = string
  description = "CIDR block for private route"
}
