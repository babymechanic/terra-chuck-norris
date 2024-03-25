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