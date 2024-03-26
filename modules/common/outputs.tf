output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "public_subnet_id_1" {
  value = aws_subnet.public_subnet_1.id
}

output "public_subnet_id_2" {
  value = aws_subnet.public_subnet_2.id
}

output "private_subnet_id_1" {
  value = aws_subnet.private_subnet_1.id
}

output "private_subnet_id_2" {
  value = aws_subnet.private_subnet_2.id
}

output "chuck_norris_ecr_repo_url" {
  value = aws_ecr_repository.chuck_norris.repository_url
}

output "chuck_norris_bucket_arn" {
  value = aws_s3_bucket.chuck_norris.arn
}