resource "aws_ecs_task_definition" "codx-task-def"{
    family                   = "codx-app"
    execution_role_arn       = "arn:aws:iam::935470747152:role/Codex-ecs-task-exec-role"
    task_role_arn            = "arn:aws:iam::935470747152:role/Codex-ecs-task-exec-role"
    network_mode             = "awsvpc"
    requires_compatibilities = ["FARGATE"]
    cpu                      = var.ecs-cluster-cpu
    memory                   = var.ecs-cluster-memory
    container_definitions    = jsonencode([
    {
      name              = "codex-app"
      image             = "935470747152.dkr.ecr.us-east-2.amazonaws.com/cars-codx-ecr-tf:v0.0.1"
      memoryReservation = 128
      essential         = true
      portMappings      = [
        {
          containerPort = 80
          hostPort      = 80
        },
        {
          containerPort = 8080
          hostPort      = 8080
        },
        {
          containerPort = 8002
          hostPort      = 8002
        }
      ]
    }
    ])
}

resource "aws_ecs_cluster" "codx-ecs-cluster" {
  name = "Codex-ecs-cluster"
}

resource "aws_ecs_service" "codx-ecs-product-client-service" {
  name                = "Codex-ecs-product-client-service"
  cluster             = aws_ecs_cluster.codx-ecs-cluster.id
  task_definition     = aws_ecs_task_definition.codx-task-def.arn
  desired_count       = 1
  launch_type         = "FARGATE"
  scheduling_strategy = "REPLICA"

  deployment_circuit_breaker {
       enable         = true
       rollback       = true
    }
    deployment_maximum_percent         = 200
    deployment_minimum_healthy_percent = 100

  network_configuration {
    security_groups   = [aws_security_group.codx-product-client-service-sg.id]
    subnets           = [var.private-subnet-1-a,var.private-subnet-1-b]
    assign_public_ip  = var.assign-public-ip-service
  }

  load_balancer {
    target_group_arn  = aws_alb_target_group.codx-ecs-product-client-service-tg.arn
    container_name    = "codex-app"
    container_port    = 80
  }
  
  depends_on = [aws_alb_listener.codx-ecs-product-client-service-alb-listener]
}

resource "aws_ecs_service" "codx-ecs-backend-service" {
  name                = "Codex-ecs-backend-service"
  cluster             = aws_ecs_cluster.codx-ecs-cluster.id
  task_definition     = aws_ecs_task_definition.codx-task-def.arn
  desired_count       = 1
  launch_type         = "FARGATE"
  scheduling_strategy = "REPLICA"

  deployment_circuit_breaker {
       enable         = true
       rollback       = true
    }
    deployment_maximum_percent         = 200
    deployment_minimum_healthy_percent = 100

  network_configuration {
    security_groups   = [aws_security_group.codx-backend-service-sg.id]
    subnets           = [var.private-subnet-1-a,var.private-subnet-1-b]
    assign_public_ip  = var.assign-public-ip-service
  }

  load_balancer {
    target_group_arn  = aws_alb_target_group.codx-ecs-backend-service-tg.arn
    container_name    = "codex-app"
    container_port    = 8080
  }
  
  depends_on = [aws_alb_listener.codx-ecs-backend-service-alb-listener]
}

resource "aws_ecs_service" "codx-ecs-platform-client-service" {
  name                = "Codex-ecs-platform-client-service"
  cluster             = aws_ecs_cluster.codx-ecs-cluster.id
  task_definition     = aws_ecs_task_definition.codx-task-def.arn
  desired_count       = 1
  launch_type         = "FARGATE"
  scheduling_strategy = "REPLICA"

  deployment_circuit_breaker {
       enable         = true
       rollback       = true
    }
    deployment_maximum_percent         = 200
    deployment_minimum_healthy_percent = 100
  
  network_configuration {
    security_groups   = [aws_security_group.codx-platform-client-service-sg.id]
    subnets           = [var.private-subnet-1-a,var.private-subnet-1-b]
    assign_public_ip  = var.assign-public-ip-service
  }

  load_balancer {
    target_group_arn  = aws_alb_target_group.codx-ecs-platform-client-service-tg.arn
    container_name    = "codex-app"
    container_port    = 8002
  }

  depends_on = [aws_alb_listener.codx-ecs-platform-client-service-alb-listener]
}