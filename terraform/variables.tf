variable "aws_region" {
  description = "AWS region to deploy all resources into"
  type        = string
  default     = "af-south-1"
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "petclinic-eks"
}

variable "environment" {
  description = "Deployment environment (e.g. production, staging)"
  type        = string
  default     = "production"

  validation {
    condition     = contains(["production", "staging", "development"], var.environment)
    error_message = "environment must be one of: production, staging, development."
  }
}

variable "domain" {
  description = "Root domain used for ingress and TLS certificates"
  type        = string
  default     = "gregddevops.com.ng"
}
