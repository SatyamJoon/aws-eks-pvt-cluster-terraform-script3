resource "aws_instance" "bastion" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.public_subnet_id
  key_name               = var.key_name
  associate_public_ip_address = true

  vpc_security_group_ids = [aws_security_group.bastion_sg.id]

  tags = {
    Name = "${var.cluster_name}-bastion"
  }
}

# Security group for bastion
resource "aws_security_group" "bastion_sg" {
  name        = "${var.cluster_name}-bastion-sg"
  description = "Allow SSH access to Bastion host"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # restrict to office IP in real-world
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}