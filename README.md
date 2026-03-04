# AWS Production Baseline (Terraform)

This repository provisions a robust, multi-AZ network foundation designed for early-stage teams and engineers who want a clean, production-style AWS starting point. It prioritizes clarity, sensible defaults, and a modular structure that grows with your application.

---

## What This Creates

- 1 VPC
- Multi-AZ public subnets
- Multi-AZ private subnets
- Internet Gateway
- NAT Gateway (cost-optimized or HA)
- Route tables and associations
- DNS support enabled
- Consistent tagging across resources

This serves as the networking foundation for:

- ECS
- EKS
- EC2
- RDS
- Load Balancers
- Any production-grade AWS workload

---

## Design Principles

- Minimal required inputs
- Opinionated but practical defaults
- Multi-AZ by default
- Cost-aware configuration
- Easy to extend
- Clean resource naming

This is meant to be a starting point — not a framework.
This project uses the excellent terraform-aws-modules/vpc/aws module.

---

## Architecture Overview

Typical traffic flow:

- Public subnets → Internet Gateway → Internet
- Private subnets → NAT Gateway → Internet (outbound only)

Private workloads remain non-public while retaining outbound internet access for updates, image pulls, and external API calls.

---

## Requirements

- Terraform >= 1.5
- AWS credentials configured (via profile, environment variables, or SSO)
- An AWS account

---

## Quick Start

Clone the repository:

```bash
git clone https://github.com/infraplane-labs/aws-production-baseline.git
cd aws-production-baseline
