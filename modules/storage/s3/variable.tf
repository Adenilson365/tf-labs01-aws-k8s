variable "default_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default = {
    "managed-by" = "terraform"
  }

}

variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "versioning" {
  description = "Whether to enable versioning on the S3 bucket"
  type        = bool
  default     = false
}

variable "acl" {
  description = "The ACL for the S3 bucket"
  type        = string
  default     = "private"
}

variable "object_ownership" {
  description = "Define ownership behavior"
  type        = string
  default     = "BucketOwnerPreferred"
}


variable "block_public_acls" {
  description = "Whether to block public ACLs on the S3 bucket"
  type        = bool
  default     = true
}

variable "block_public_policy" {
  description = "Whether to block public bucket policies on the S3 bucket"
  type        = bool
  default     = true
}

variable "ignore_public_acls" {
  description = "Whether to ignore public ACLs on the S3 bucket"
  type        = bool
  default     = true
}

variable "restrict_public_buckets" {
  description = "Whether to restrict public bucket policies on the S3 bucket"
  type        = bool
  default     = true
}

variable "paths" {
  type        = list(string)
  default     = []
  description = "List of paths to create in the S3 bucket, subdirectories should be separated by a slash (e.g., 'folder1/folder2/')"
}