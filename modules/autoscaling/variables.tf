variable "launch_template_id" {
  description = "Launch Template ID for EC2 instances"
  type        = string
}

variable "target_group_arn" {
  description = "Target Group ARN for ALB"
  type        = string
}

variable "vpc_zone_identifier" {
  description = "List of subnet IDs for Auto Scaling Group"
  type        = list(string)
}
