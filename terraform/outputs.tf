output "cluster_name" {
  description = "Name of the EKS cluster"
  value       = module.eks.cluster_name
}

output "cluster_endpoint" {
  description = "API server endpoint of the EKS cluster"
  value       = module.eks.cluster_endpoint
}

output "configure_kubectl" {
  description = "AWS CLI command to update the local kubeconfig for this cluster"
  value       = "aws eks update-kubeconfig --region ${var.aws_region} --name ${module.eks.cluster_name}"
}

output "ecr_urls" {
  description = "Map of ECR repository name to repository URL"
  value       = module.ecr.repository_urls
}

output "db_endpoint" {
  description = "RDS instance endpoint (host:port)"
  value       = module.rds.db_endpoint
  sensitive   = true
}

output "secret_arn" {
  description = "ARN of the Secrets Manager secret holding database credentials"
  value       = module.rds.secret_arn
}
