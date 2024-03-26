resource "aws_s3_bucket" "chuck_norris" {
  bucket        = format("%s-chuck-norris", var.environment)
  force_destroy = true
  tags          = {
    Name : format("%s-chuck-norris", var.environment)
  }
}

