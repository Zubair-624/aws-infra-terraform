module "networking" {
  source = "./modules/networking"

  project_name = var.project_name
  environment  = var.environment

  vpc_cidr    = var.vpc_cidr
  subnet_cidr = var.subnet_cidr
  aws_region  = var.aws_region
}

module "compute" {
  source = "./modules/compute"

  project_name = var.project_name
  environment  = var.environment

  vpc_id        = module.networking.vpc_id
  subnet_id     = module.networking.subnet_id
  instance_type = var.instance_type
  my_ip         = var.my_ip
}

module "state_backend" {
  source = "./modules/state-backend"

  project_name = var.project_name
  environment  = var.environment

}