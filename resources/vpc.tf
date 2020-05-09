# Define a VPC
resource "aws_vpc" "vpc_super_mario" {
  cidr_block = "${var.vpc_cidr}"
  enable_dns_hostnames = true
  tags = {
    Name = "vpc_super_mario"
  }
}