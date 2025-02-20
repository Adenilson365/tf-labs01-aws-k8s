output "endpoint" {
  value = aws_db_instance.db.endpoint
}

output "username" {
  value     = aws_db_instance.db.username
  sensitive = false
}

output "password" {
  value     = aws_db_instance.db.password
  sensitive = true
}