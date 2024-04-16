module "roles_admin" {
  source = "./roles/admin"

  stage = var.stage
  project = var.project
  region = var.region
  aws_account_id = var.aws_account_id

  admin_path = local.roles["admin"]
}

module "roles_developer" {
  source = "./roles/developer"

  stage = var.stage
  project = var.project
  region = var.region
  aws_account_id = var.aws_account_id

  developer_path = local.roles["developer"]
}

module "roles_dba" {
  source = "./roles/dba"

  stage = var.stage
  project = var.project
  region = var.region
  aws_account_id = var.aws_account_id
  
  dba_path = local.roles["dba"]
}

module "roles_serveless" {
  source = "./roles/serveless"

  stage = var.stage
  project = var.project
  region = var.region
  aws_account_id = var.aws_account_id
  
  serveless_path = local.roles["serveless"]
}
