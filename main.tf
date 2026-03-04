data "aws_availability_zones" "available" {
  state = "available"
}

locals {
  name_prefix = "${var.project}-${var.environment}"

  azs      = slice(data.aws_availability_zones.available.names, 0, var.az_count)
  az_count = length(local.azs)

  subnet_newbits   = 8   # /24s from a /16
  public_offset    = 0
  private_offset   = 100

  public_subnets = [
    for i in range(local.az_count) :
    cidrsubnet(var.vpc_cidr, local.subnet_newbits, local.public_offset + i)
  ]

  private_subnets = [
    for i in range(local.az_count) :
    cidrsubnet(var.vpc_cidr, local.subnet_newbits, local.private_offset + i)
  ]
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name = local.name_prefix
  cidr = var.vpc_cidr

  azs             = local.azs
  public_subnets  = local.public_subnets
  private_subnets = local.private_subnets

  enable_dns_hostnames = true
  enable_dns_support   = true

  enable_nat_gateway = true
  single_nat_gateway = var.single_nat_gateway

  enable_ipv6 = false

}