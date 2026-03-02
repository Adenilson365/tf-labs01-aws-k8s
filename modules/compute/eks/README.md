# EKS Module

## Goal

Short description of what this module creates and why.

## What it creates

- EKS Cluster
- Managed Node Groups
- Addons (vpc-cni, coredns, kube-proxy)
- IAM roles/policies (if applicable)

## Requirements

- Terraform >= 1.5
- AWS Provider >= 5.x

## How to configure ip delegation

> This feature allow us to allocate more IP on EC2 nitro worker node.

[Documentation - EKS Addon describe](https://docs.aws.amazon.com/cli/latest/reference/eks/describe-addon-configuration.html)

[Documentation - EKS Prefix mode](https://docs.aws.amazon.com/eks/latest/best-practices/prefix-mode-linux.html)

[Documentation - Terraform jsonEnconde](https://developer.hashicorp.com/terraform/language/functions/jsonencode)

## Usage

```hcl
module "eks" {
  source = "../modules/eks"

  cluster_name = "lab-eks"
  vpc_id       = "vpc-xxxx"
  subnet_ids   = ["subnet-a", "subnet-b"]

  enable_prefix_delegation = true
}
```
