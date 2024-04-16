data "aws_availability_zones" "available" {
  state = "available"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"

  name                 = "${var.stage}-${var.project}-vpc"

  cidr                 = "10.0.0.0/16"
  azs                  = data.aws_availability_zones.available.names
  private_subnets      = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets       = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  database_subnets     = ["10.0.21.0/24", "10.0.22.0/24"]


  enable_nat_gateway   = true
  
  create_database_subnet_group           = true
  create_database_subnet_route_table     = true
  create_database_internet_gateway_route = true
}

resource "aws_vpc_endpoint" "s3" {
  vpc_id = module.vpc.vpc_id
  service_name = "com.amazonaws.${var.region}.s3"
  vpc_endpoint_type = "Gateway"

  route_table_ids = [module.vpc.database_route_table_ids[0]]
}

resource "aws_vpc_endpoint" "dynamodb" {
  vpc_id = module.vpc.vpc_id
  service_name = "com.amazonaws.${var.region}.dynamodb"
  vpc_endpoint_type = "Gateway"

  route_table_ids = [module.vpc.database_route_table_ids[0]]
}

resource "aws_vpc_endpoint" "secrets_manager" {
  vpc_id = module.vpc.vpc_id
  service_name = "com.amazonaws.${var.region}.secretsmanager"
  vpc_endpoint_type = "Interface"

  subnet_ids = module.vpc.database_subnets
  security_group_ids = [ aws_security_group.security_group.id ]
}

resource "aws_vpc_endpoint" "kms" {
  vpc_id = module.vpc.vpc_id
  service_name = "com.amazonaws.${var.region}.kms"
  vpc_endpoint_type = "Interface"

  subnet_ids = module.vpc.database_subnets
  security_group_ids = [ aws_security_group.security_group.id ]
}