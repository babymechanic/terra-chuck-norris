output "vpc_id" {
  value = module.common_infra.vpc_id
}

output "public_subnet_id_1" {
  value = module.common_infra.public_subnet_id_1
}

output "public_subnet_id_2" {
  value = module.common_infra.public_subnet_id_2
}

output "private_subnet_id_1" {
  value = module.common_infra.private_subnet_id_1
}

output "private_subnet_id_2" {
  value = module.common_infra.private_subnet_id_2
}

output "chuck_norris_ecr_repo_url" {
  value = module.common_infra.chuck_norris_ecr_repo_url
}

output "chuck_norris_bucket_arn" {
  value = module.common_infra.chuck_norris_bucket_arn
}