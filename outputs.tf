output "alb_dns_name" {
  description = "Public DNS of the Application Load Balancer"
  value       = module.alb_ec2.alb_dns_name
}

output "asg_name" {
  description = "Auto Scaling Group Name"
  value       = module.autoscaling.asg_name
}
