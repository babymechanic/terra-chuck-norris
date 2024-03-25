resource "aws_ecs_cluster" "chuck_norris_app" {
  name = format("%s_chuck_norris_app_ecs_cluster", var.environment)
}

resource "aws_ecs_service" "chuck_norris_app" {
  name            = format("%s_chuck_norris_ecs_service", var.environment)
  cluster         = aws_ecs_cluster.chuck_norris_app.id
  task_definition = aws_ecs_task_definition.chuck_norris.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = [var.private_subnet_id_1, var.private_subnet_id_2]
    security_groups  = [aws_security_group.ecs_tasks.id]
    assign_public_ip = false
  }

  load_balancer {
    container_name   = "chuck_norris"
    container_port   = 8080
    target_group_arn = aws_lb_target_group.chuck_norris.arn
  }

  depends_on = [aws_lb_listener.http_forward, aws_iam_role_policy_attachment.ecs_task_execution_role]

  tags = {
    Environment = var.environment,
    Application = format("%s_chuck_norris_api", var.environment)
  }
}

resource "aws_cloudwatch_log_group" "chuck_norris_api" {
  name = "awslogs-chuck_norris-${var.environment}"

  tags = {
    Environment = var.environment
    Application = format("%s_chuck_norris_api", var.environment)
  }
}
