resource "aws_lb" "alb" {
  name               = "alb"
  internal           = false
  load_balancer_type = "application"

  security_groups = [aws_security_group.sg_tf.id]
  subnets         = [aws_subnet.sub1_tf.id, aws_subnet.sub2_tf.id]

}

resource "aws_lb_target_group" "target" {
  name     = "albtargetgroup"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc_tf.id

  health_check {
    path = "/"
    port = "traffic-port"
  }

}

resource "aws_lb_target_group_attachment" "target_group_attach1" {
  target_group_arn = aws_lb_target_group.target.arn
  target_id        = aws_instance.instance1_tf.id
  port             = 80

}
resource "aws_lb_target_group_attachment" "target_group_attach2" {
  target_group_arn = aws_lb_target_group.target.arn
  target_id        = aws_instance.instance2_tf.id
  port             = 80

}

resource "aws_lb_listener" "lb_listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.target.arn
    type             = "forward"
  }

}

output "lbdns" {
  value = aws_lb.alb.dns_name

}