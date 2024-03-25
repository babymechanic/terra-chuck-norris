data "template_file" "chuck_norris_app" {
  template = file("${path.module}/app_task_def.json.tpl")
  vars     = {
    docker_repository = "marcnuri/chuck-norris"
    tag                = "latest"
    api_name           = "chuck_norris"
    app_port           = 80
    aws_region         = var.aws_region
    environment        = var.environment
    container_port     = 8080
    host_port          = 8080
  }
}

resource "aws_ecs_task_definition" "chuck_norris" {
  family                   = format("chuck_norris_%s", var.environment)
  network_mode             = "awsvpc"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  cpu                      = 256
  memory                   = 2048
  requires_compatibilities = ["FARGATE"]
  container_definitions    = data.template_file.chuck_norris_app.rendered
  tags                     = {
    Environment = var.environment
    Application = "chuck_norris"
  }
}