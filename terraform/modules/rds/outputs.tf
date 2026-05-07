output "db_endpoint" {
  description = "Hostname of the RDS instance (no port)"
  value       = aws_db_instance.this.address
}

output "db_port" {
  description = "Port the RDS instance listens on"
  value       = aws_db_instance.this.port
}

output "db_name" {
  description = "Name of the database"
  value       = aws_db_instance.this.db_name
}

output "db_password" {
  description = "Generated database password"
  value       = random_password.db.result
  sensitive   = true
}

output "secret_arn" {
  description = "ARN of the Secrets Manager secret holding all DB credentials"
  value       = aws_secretsmanager_secret.db_credentials.arn
}
