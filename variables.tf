variable "region" {
    type        = string
    description = "AWS region to deploy resources to"
    default     = "us-east-1"
}

variable "profile" {
    type        = string
    description = "AWS profile to authenticate with (optional)"
    default     = null
}

variable "tags" {
    type        = map(string)
    description = "Additional tags applied to all resources"
    default     = {}
}

variable "project" {
  type        = string
  description = "Project/app name used for naming resources"
}

variable "environment" {
  type        = string
  description = "Environment name (dev/stage/prod)"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC (e.g., 10.20.0.0/16)"
}

variable "az_count" {
  type        = number
  description = "Number of AZs to use (2 or 3 recommended)"
  default     = 2
}

variable "single_nat_gateway" {
  type        = bool
  description = "true = cheaper (1 NAT). false = HA (N NATs)"
  default     = true
}