module "iam" {
  source = "./modules/iam"

  stage = var.stage
  project = var.project
  region = var.region
  aws_account_id = var.aws_account_id
}