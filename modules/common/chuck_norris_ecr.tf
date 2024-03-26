resource "aws_ecr_repository" "chuck_norris" {
  name = format("%s_chuck_norris_ecr", var.environment)
}