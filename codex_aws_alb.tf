resource "aws_alb" "codx-ecs-alb" {
  name            = "Codex-ecs-alb"
  internal        = true
  subnets         = [var.private-subnet-1-a,var.private-subnet-1-b]
  security_groups = [aws_security_group.codx-ecs-alb-sg.id]
}

resource "aws_alb_target_group" "codx-ecs-product-client-service-tg" {
  name        = "Codex-ecs-product-client-tg"
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = var.vpc

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 30
  }
}

resource "aws_alb_target_group" "codx-ecs-backend-service-tg" {
  name        = "Codex-ecs-backend-tg"
  port        = 8080
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = var.vpc

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 30
  }
}

resource "aws_alb_target_group" "codx-ecs-platform-client-service-tg" {
  name        = "Codex-ecs-platform-client-tg"
  port        = 8002
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = var.vpc

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 30
  }
}

resource "aws_alb_listener" "codx-ecs-product-client-service-alb-listener" {
  load_balancer_arn = aws_alb.codx-ecs-alb.id
  port              = 80
  protocol          = "HTTP"
  
  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.codx-ecs-product-client-service-tg.arn
  }
}

resource "aws_alb_listener" "codx-ecs-backend-service-alb-listener" {
  load_balancer_arn = aws_alb.codx-ecs-alb.id
  port              = 8080
  protocol          = "HTTP"
  
  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.codx-ecs-backend-service-tg.arn
  }
}

resource "aws_alb_listener" "codx-ecs-platform-client-service-alb-listener" {
  load_balancer_arn = aws_alb.codx-ecs-alb.id
  port              = 8002
  protocol          = "HTTP"
  
  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.codx-ecs-platform-client-service-tg.arn
  }
}
