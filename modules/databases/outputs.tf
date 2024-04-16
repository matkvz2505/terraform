output "cluster_endpoint" {
  value = module.rds_aurora_postgres.cluster_endpoint
}

output "cluster_database_name" {
  value = module.rds_aurora_postgres.cluster_database_name
}
