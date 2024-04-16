module "users_admin" {
  depends_on = [module.group_admin]
  source     = "./users/admin"

  stage = var.stage
  project = var.project
  region = var.region
  aws_account_id = var.aws_account_id

  group_admin_name = module.group_admin.group_admin_name
}

module "users_developer" {
  depends_on = [module.group_developer]
  source     = "./users/developer"

  stage = var.stage
  project = var.project
  region = var.region
  aws_account_id = var.aws_account_id

  group_developer_name = module.group_developer.group_developer_name
}

module "users_dba" {
  depends_on = [module.group_dba]
  source     = "./users/dba"

  stage = var.stage
  project = var.project
  region = var.region
  aws_account_id = var.aws_account_id

  group_dba_name = module.group_dba.group_dba_name
}

module "users_serveless" {
  depends_on = [module.group_serveless]
  source     = "./users/serveless"

  stage = var.stage
  project = var.project
  region = var.region
  aws_account_id = var.aws_account_id

  group_serveless_name = module.group_serveless.group_serveless_name
}
