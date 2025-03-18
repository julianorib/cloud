## Criar um Security Group de acesso WEB
resource "aws_security_group" "example" {
  name        = "example"
  description = "permite acesso web"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

## Criar o Loadbalance Example
resource "aws_lb" "example" {
  name               = "Example"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.example.id]
  subnets            = data.aws_subnets.default.ids

  enable_deletion_protection = false

  tags = {
    Environment = "production"
  }
}

## Criar um Target Group 
resource "aws_lb_target_group" "example" {
  name     = "example"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.default.id
}

## Criar um Listener Forward
resource "aws_lb_listener" "forward" {
  load_balancer_arn = aws_lb.example.arn
  port = "80"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.example.arn
  }
  
}

## Associar / Registrar o ASG ao Loadbalance
resource "aws_autoscaling_attachment" "example" {
  autoscaling_group_name = aws_autoscaling_group.example.id
  lb_target_group_arn    = aws_lb_target_group.example.arn
}