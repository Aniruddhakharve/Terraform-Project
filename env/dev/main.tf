provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source         = "../../modules/vpc"
  vpc_cidr       = var.vpc_cidr
  public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  aws_region     = var.aws_region
}

module "alb_ec2" {
  source        = "../../modules/alb_ec2"
  vpc_id        = module.vpc.vpc_id
  subnets       = module.vpc.public_subnet_ids
  instance_type = var.instance_type
}

module "autoscaling" {
  source              = "../../modules/autoscaling"
  launch_template_id  = module.alb_ec2.launch_template_id
  target_group_arn    = module.alb_ec2.target_group_arn
  vpc_zone_identifier = module.vpc.public_subnet_ids
}
