output "private_subnet_ids" {
  value = module.vpc.private_subnets
}

output "public_subnet_ids" {
  value = module.vpc.public_subnets
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "availability_zone" {
  value = module.vpc.azs
}

output "database_subnets_ids" {
  value = module.vpc.database_subnets
}

output "security_group_name" {
  value = aws_security_group.security_group.name
}

output "security_group_id" {
  value = aws_security_group.security_group.id
}

output "database_subnet_group_name" {
  value = "${module.vpc.database_subnet_group_name}"
}