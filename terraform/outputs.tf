output "master_public_ip" {
  value = aws_instance.master.public_ip
}
output "monitoring_public_ip" {
  value = aws_instance.monitoring.public_ip
}
