
variable "cluster_name" {}
variable "vpc_id" {}
variable "public_subnet_id" {}
variable "ami_id" {
  description = "Amazon Linux 2 AMI ID (region-specific)"
}
variable "instance_type" {
  default = "t3.micro"
}
variable "key_name" {
  description = "SSH key name for EC2 login"
}
