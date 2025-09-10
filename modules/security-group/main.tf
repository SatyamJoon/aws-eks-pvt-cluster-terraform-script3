resource "aws_security_group" "workers" {
  name        = var.sg_name
  description = var.sg_description
  vpc_id      = var.vpc_id

  ingress {
    from_port   = var.ingress_self_from_port
    to_port     = var.ingress_self_to_port
    protocol    = var.ingress_self_protocol
    self        = var.ingress_self_self
    description = var.ingress_self_description
  }

  ingress {
    from_port   = var.ingress_cp_from_port
    to_port     = var.ingress_cp_to_port
    protocol    = var.ingress_cp_protocol
    cidr_blocks = var.ingress_cp_cidr_blocks
    description = var.ingress_cp_description
  }

  egress {
    from_port   = var.egress_from_port
    to_port     = var.egress_to_port
    protocol    = var.egress_protocol
    cidr_blocks = var.egress_cidr_blocks
  }

  tags = var.tags
}