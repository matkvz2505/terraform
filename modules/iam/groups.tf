module "group_admin" {
  depends_on = [module.roles_admin]
  source     = "./groups/admin"

  stage = var.stage
  project = var.project
  region = var.region
  aws_account_id = var.aws_account_id

  admin_path = "${local.roles["admin"]}"

  admin_policy_instance_arn = module.roles_admin.admin_policy_instance_arn
}

module "group_developer" {
  depends_on = [module.roles_developer]
  source     = "./groups/developer"

  stage = var.stage
  project = var.project
  region = var.region
  aws_account_id = var.aws_account_id

  developer_path = "${local.roles["developer"]}"

  developer_policy_arn = module.roles_developer.developer_policy_arn
  developer_iam_requested_region_policy_arn = module.roles_developer.developer_iam_requested_region_policy_arn
  developer_iam_deny_delete_policy_arn = module.roles_developer.developer_iam_deny_delete_policy_arn
}

module "group_dba" {
  depends_on = [module.roles_dba]
  source     = "./groups/dba"

  stage = var.stage
  project = var.project
  region = var.region
  aws_account_id = var.aws_account_id

  dba_path = local.roles["dba"]

  dba_policy_instance_arn = module.roles_dba.dba_policy_instance_arn
}

module "group_serveless" {
  depends_on = [module.roles_serveless]
  source     = "./groups/serveless"

  stage = var.stage
  project = var.project
  region = var.region
  aws_account_id = var.aws_account_id

  serveless_path = local.roles["serveless"]

  serveless_policy_instance_arn = module.roles_serveless.serveless_policy_instance_arn
}
