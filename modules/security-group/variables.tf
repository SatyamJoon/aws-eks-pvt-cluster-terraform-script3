
variable "sg_name" {
  type        = string
  description = "Name of the security group"
}

variable "sg_description" {
  type        = string
  description = "Description for the security group"
}

variable "vpc_id" {
  type        = string
  description = "The ID of the VPC"
}

variable "cluster_name" {
  description = "The name of the cluster"
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "ingress_self_from_port" {
  type        = number
  description = "Ingress self from port"
}

variable "ingress_self_to_port" {
  type        = number
  description = "Ingress self to port"
}

variable "ingress_self_protocol" {
  type        = string
  description = "Protocol for self ingress"
}

variable "ingress_self_self" {
  type        = bool
  description = "Whether self traffic is allowed"
}

variable "ingress_self_description" {
  type        = string
  description = "Description for self ingress"
}

variable "ingress_cp_from_port" {
  type        = number
  description = "Ingress from port for control plane access"
}

variable "ingress_cp_to_port" {
  type        = number
  description = "Ingress to port for control plane access"
}

variable "ingress_cp_protocol" {
  type        = string
  description = "Protocol for control plane ingress"
}

variable "ingress_cp_cidr_blocks" {
  type        = list(string)
  description = "CIDR blocks for control plane ingress"
}

variable "ingress_cp_description" {
  type        = string
  description = "Description for control plane ingress"
}

variable "egress_from_port" {
  type        = number
  description = "Egress from port"
}

variable "egress_to_port" {
  type        = number
  description = "Egress to port"
}

variable "egress_protocol" {
  type        = string
  description = "Protocol for egress"
}

variable "egress_cidr_blocks" {
  type        = list(string)
  description = "CIDR blocks for egress"
}

variable "tags" {
  type        = map(string)
  description = "Tags for the security group"
}
