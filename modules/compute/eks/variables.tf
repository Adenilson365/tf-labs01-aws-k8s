variable "default_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default = {
    "managed-by" = "TF"
  }

}

variable "node_group_name" {
  description = "The name of the node group"
  type        = string
  
}

variable "instance_types" {
  description = "The instance types to use for the node group"
  type        = list(string)
}

variable "desired_size" {
  description = "The desired number of worker nodes"
  type        = number
}

variable "max_size" {
  description = "The maximum number of worker nodes"
  type        = number
}

variable "min_size" {
  description = "The minimum number of worker nodes"
  type        = number
}

variable "pvt_subnet_ids" {
  description = "The private subnet IDs to launch the worker nodes into"
  type        = list(string)
  
}

#EKS Cluster

variable "eks_subnet_ids" {
  description = "The subnet IDs to launch the EKS cluster into"
  type        = list(string)
}

variable "eks_name" {
    description = "The name of the EKS cluster"
    type        = string
}

variable "eks_version" {
    description = "The Kubernetes version for the EKS cluster"
    type        = string
}

variable "authentication_mode" {
    description = "The authentication mode for the EKS cluster"
    type        = string
    default     = "API"
}