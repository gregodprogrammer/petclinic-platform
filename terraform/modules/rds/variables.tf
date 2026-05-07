variable "cluster_name" {
  description = "EKS cluster name — used in resource names and identifiers"
  type        = string
}

variable "environment" {
  description = "Deployment environment (e.g. production, staging)"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC where the RDS instance is deployed"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block of the VPC — used to allow MySQL ingress from all VPC hosts"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_ids" {
  description = "List of subnet IDs for the DB subnet group"
  type        = list(string)
}

variable "node_security_group_id" {
  description = "Security group ID of EKS managed nodes — granted ingress on port 3306"
  type        = string
}
