module "iam" {
  source = "./modules/iam"

  stage = var.stage
  project = var.project
  region = var.region
  aws_account_id = var.aws_account_id
}

module "network" {
  source = "./modules/network"

  stage   = var.stage
  region  = var.region
  project = var.project
}

module "databases" {
  source = "./modules/databases"

  depends_on = [module.network]

  region          = var.region
  stage           = var.stage
  project         = var.project
  aws_account_id  = var.aws_account_id
  master_username = var.master_username
  master_password = var.master_password
  vpc_id          = module.network.vpc_id
  database_subnets_ids       = module.network.database_subnets_ids
  security_group_id          = [module.network.security_group_id]
  security_group_name        = ["${module.network.security_group_name}"]
  database_subnet_group_name = ["${module.network.database_subnet_group_name}"]
}
