output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnet_id" {
  value = aws_subnet.private.id
}

output "alb_dns_name" {
  value = aws_lb.main.dns_name
}

output "autoscaling_group_name" {
  value = aws_autoscaling_group.web.name
}

output "rds_endpoint" {
  value = aws_db_instance.main.endpoint
}