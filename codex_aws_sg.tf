resource "aws_security_group" "codx-ecs-alb-sg" {
  name        = "Codex-ecs-alb-sg"
  description = "Security group for Codex ECS Application Loadbalancer"
  vpc_id      = var.vpc

  egress = [
    {
      description      = "Outbound rules for codex application"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = [] 
      security_groups  = [] 
      self             = "false"
    }
  ]
}

resource "aws_security_group_rule" "codx-ecs-alb-sg-rule-1" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = "${aws_security_group.codx-ecs-alb-sg.id}"
  source_security_group_id = "${aws_security_group.codx-product-client-service-sg.id}"
}

resource "aws_security_group_rule" "codx-ecs-alb-sg-rule-2" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  security_group_id = "${aws_security_group.codx-ecs-alb-sg.id}"
  source_security_group_id = "${aws_security_group.codx-backend-service-sg.id}"
}

resource "aws_security_group_rule" "codx-ecs-alb-sg-rule-3" {
  type              = "ingress"
  from_port         = 8002
  to_port           = 8002
  protocol          = "tcp"
  security_group_id = "${aws_security_group.codx-ecs-alb-sg.id}"
  source_security_group_id = "${aws_security_group.codx-platform-client-service-sg.id}"
}

resource "aws_security_group_rule" "codx-ecs-alb-sg-rule-4" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = "${aws_security_group.codx-ecs-alb-sg.id}"
  source_security_group_id = "${aws_security_group.codx-rds-sg.id}"
}

resource "aws_security_group_rule" "codx-ecs-alb-sg-rule-5" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  security_group_id = "${aws_security_group.codx-ecs-alb-sg.id}"
  source_security_group_id = "${aws_security_group.codx-rds-sg.id}"
}

resource "aws_security_group_rule" "codx-ecs-alb-sg-rule-6" {
  type              = "ingress"
  from_port         = 8002
  to_port           = 8002
  protocol          = "tcp"
  security_group_id = "${aws_security_group.codx-ecs-alb-sg.id}"
  source_security_group_id = "${aws_security_group.codx-rds-sg.id}"
}

resource "aws_security_group" "codx-product-client-service-sg" {
  name        = "Codex-product-client-service-sg"
  description = "Security group for codex product client service"
  vpc_id      = var.vpc

    egress = [
    {
      description      = "Outbound rules for codex application"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = [] 
      security_groups  = [] 
      self             = "false"
    }
  ]
}

resource "aws_security_group_rule" "codx-product-client-service-sg-rule-1" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = "${aws_security_group.codx-product-client-service-sg.id}"
  source_security_group_id = "${aws_security_group.codx-ecs-alb-sg.id}"
}

resource "aws_security_group_rule" "codx-product-client-service-sg-rule-2" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = "${aws_security_group.codx-product-client-service-sg.id}"
  source_security_group_id = "${aws_security_group.codx-rds-sg.id}"
}

resource "aws_security_group" "codx-backend-service-sg" {
  name        = "Codex-backend-service-sg"
  description = "Security group for codex backend service"
  vpc_id      = var.vpc

    egress = [
    {
      description      = "Outbound rules for codex application"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = [] 
      security_groups  = [] 
      self             = "false"
    }
  ]
}

resource "aws_security_group_rule" "codx-backend-service-sg-rule-1" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  security_group_id = "${aws_security_group.codx-backend-service-sg.id}"
  source_security_group_id = "${aws_security_group.codx-ecs-alb-sg.id}"
}

resource "aws_security_group_rule" "codx-backend-service-sg-rule-2" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  security_group_id = "${aws_security_group.codx-backend-service-sg.id}"
  source_security_group_id = "${aws_security_group.codx-rds-sg.id}"
}

resource "aws_security_group" "codx-platform-client-service-sg" {
  name        = "Codex-platform-client-service-sg"
  description = "Security group for codex platform client service"
  vpc_id      = var.vpc

    egress = [
    {
      description      = "Outbound rules for codex application"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = [] 
      security_groups  = [] 
      self             = "false"
    }
  ]
}

resource "aws_security_group_rule" "codx-platform-client-service-sg-rule-1" {
  type              = "ingress"
  from_port         = 8002
  to_port           = 8002
  protocol          = "tcp"
  security_group_id = "${aws_security_group.codx-platform-client-service-sg.id}"
  source_security_group_id = "${aws_security_group.codx-ecs-alb-sg.id}"
}

resource "aws_security_group_rule" "codx-platform-client-service-sg-rule-2" {
  type              = "ingress"
  from_port         = 8002
  to_port           = 8002
  protocol          = "tcp"
  security_group_id = "${aws_security_group.codx-platform-client-service-sg.id}"
  source_security_group_id = "${aws_security_group.codx-rds-sg.id}"
}

resource "aws_security_group" "codx-rds-sg" {
  name        = "Codex-rds-sg"
  description = "Security group for codex RDS"
  vpc_id      = var.vpc

    ingress = [
    {
      description      = "Inbound rule for Codex RDS"
      from_port        = 5432
      to_port          = 5432
      protocol         = "tcp"
      cidr_blocks      = []
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = [aws_security_group.codx-ecs-alb-sg.id]
      self             = "false"
    },

    {
      description      = "Inbound rule for Codex RDS"
      from_port        = 5432
      to_port          = 5432
      protocol         = "tcp"
      cidr_blocks      = []
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = [aws_security_group.codx-platform-client-service-sg.id]
      self             = "false"
    },

    {
      description      = "Inbound rule for Codex RDS"
      from_port        = 5432
      to_port          = 5432
      protocol         = "tcp"
      cidr_blocks      = []
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = [aws_security_group.codx-backend-service-sg.id]
      self             = "false"
    },

    {
      description      = "Inbound rule for Codex RDS"
      from_port        = 5432
      to_port          = 5432
      protocol         = "tcp"
      cidr_blocks      = []
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = [aws_security_group.codx-product-client-service-sg.id]
      self             = "false"
    }

  ]

    egress = [
    {
      description      = "Outbound rules for Codex RDS"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = [] 
      security_groups  = [] 
      self             = "false"
    }
  ]
}

resource "aws_db_subnet_group" "codx-rds-subnet-group" {
  name       = "codex-rds-subnet-group"
  subnet_ids = [var.private-subnet-1-a, var.private-subnet-1-b]
}