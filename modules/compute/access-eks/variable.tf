variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string

}

variable "principal_arn" {
  description = "The ARN of the principal to allow access to the EKS cluster"
  type        = string
}

variable "type" {
  description = "The type of access to allow to the EKS cluster"
  type        = string
}

variable "policy_arn" {
  description = "The ARN of the policy to attach to the EKS cluster"
  type        = string

}

variable "scope_type" {
  description = "The type of access scope to allow to the EKS cluster"
  type        = string
}

variable "namespaces" {
  description = "The namespaces to allow access to the EKS cluster"
  type        = list(string)
}