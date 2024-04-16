data "aws_db_subnet_group" "database" {
  name = join(", ", var.database_subnet_group_name)
}

module "rds_aurora_postgres" {
  source = "terraform-aws-modules/rds-aurora/aws"

  name           = "${var.stage}-${var.project}-aurora-db-postgres"
  engine         = "aurora-postgresql"
  database_name  = "${var.stage}${var.project}"
  engine_version = "13.10" # Do not change version, above version 14 it causes breakage when using Glue Crawlers for mapping tables
  instance_class = "db.r5.large"
    instances = {
    one = {}
    two = {
      instance_class = "db.r5.large"
    }
  }

  vpc_id                 = var.vpc_id
  vpc_security_group_ids = ["${var.security_group_id[0]}"]
  db_subnet_group_name   = data.aws_db_subnet_group.database.name
  network_type = "IPV4"
  
  storage_encrypted = true
  publicly_accessible = true
  apply_immediately = true
  create_security_group = false

  skip_final_snapshot = false
  final_snapshot_identifier = "${var.stage}-${var.project}"

  master_username = var.master_username
  master_password = var.master_password
  manage_master_user_password = false

  tags = {
    Terraform   = "true"
  }
}

