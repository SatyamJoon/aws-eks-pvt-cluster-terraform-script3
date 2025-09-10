# General Configuration
aws_region            = "us-east-1"
cluster_name          = "private-eks-cluster"
vpc_cidr              = "10.10.0.0/16"
public_subnets_cidrs  = ["10.10.1.0/24", "10.10.2.0/24"]
private_subnets_cidrs = ["10.10.11.0/24", "10.10.12.0/24"]
availability_zones    = ["us-east-1a", "us-east-1b"]

# DNS Configuration for VPC
enable_dns_hostnames = true
enable_dns_support   = true

# Routes
public_route_cidr   = "0.0.0.0/0"
private_route_cidr  = "0.0.0.0/0"

# Node Group Configuration
node_group_instance_types = ["t3.small"]
node_group_desired      = 2
node_group_min          = 1
node_group_max          = 3

# EKS Configuration
cluster_version         = "1.28"

# EKS IAM Policies
eks_cluster_policies = [
  "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy",
  "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
]

eks_node_policies = [
  "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
  "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly",
  "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy",
  "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
]

# EKS Module Specific Variables
#private_subnets_ids     = ["subnet-xxxxxxx1", "subnet-xxxxxxx2"]   # Replace with actual subnet IDs created via VPC module
#cluster_role_arn        = "arn:aws:iam::123456789012:role/eks-cluster-role"  # Replace with actual IAM role ARN
#node_group_role_arn    = "arn:aws:iam::123456789012:role/eks-nodegroup-role" # Replace with actual IAM role ARN

endpoint_private_access  = true
endpoint_public_access   = false
public_access_cidrs      = []  # Empty as public access is disabled

enabled_cluster_log_types = ["api", "audit", "authenticator"]


 # Usually empty or set with explicit resources if required

ec2_ssh_key            = "my-key-pair"  # Replace with your EC2 key name

ami_type               = "AL2_x86_64"


# Security Group Configuration
sg_name                  = "private-eks-cluster-workers-sg"
endpoints_sg_name = "private-eks-cluster-endpoints-sg"
sg_description           = "Security group for EKS worker nodes"
#vpc_id                   = "vpc-xxxxxxxx"  # Replace with actual VPC ID
ingress_self_from_port   = 0
ingress_self_to_port     = 0
ingress_self_protocol    = "-1"
ingress_self_self        = true
ingress_self_description = "Allow intra-node communication"

ingress_cp_from_port    = 443
ingress_cp_to_port      = 443
ingress_cp_protocol     = "tcp"
#ingress_cp_cidr_blocks  = [vpc_cidr]
ingress_cp_description = "Allow nodes to reach control plane"

egress_from_port        = 0
egress_to_port          = 0
egress_protocol         = "-1"
egress_cidr_blocks      = ["0.0.0.0/0"]

# VPC Endpoint Configuration
s3_service_name        = "s3"
s3_vpc_endpoint_type   = "Gateway"
#route_table_private_id = "rtb-xxxxxxxx"  # Replace with actual private route table ID
#route_table_public_id  = "rtb-yyyyyyyy"  # Replace with actual public route table ID

interface_endpoints = [
  "ecr.api",
  "ecr.dkr",
  "sts",
  "logs",
  "ec2"
]

#endpoints_sg_name        = "${cluster_name}-endpoints-sg"
endpoints_sg_description = "Security group for interface endpoints"

ingress_from_port      = 443
ingress_to_port        = 443
ingress_protocol       = "tcp"
#ingress_cidr_blocks    = [vpc_cidr]
ingress_cidr_blocks = ["10.10.0.0/16"]
ingress_cp_cidr_blocks = ["10.10.0.0/16"]



interface_vpc_endpoint_type = "Interface"
private_dns_enabled        = true

node_group_tags = {
  Name = "private-eks-cluster-managed-node"
}

tags = {
  Name = "private-eks-cluster"
}

# Bastion configs
bastion_ami_id        = "ami-0dba2cb6798deb6d8" # Amazon Linux 2 in eu-west-3
bastion_instance_type = "t3.micro"
bastion_key_name      = "my-keypair"  # Replace with your AWS keypair name
