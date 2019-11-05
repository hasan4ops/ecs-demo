resource "aws_lb" "web_elb" {
  name                       = "web-elb"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = ["${aws_security_group.lb_sg.id}"]
  subnets                    = ["${aws_subnet.subnet_public1.id}" , "${aws_subnet.subnet_public2.id}"]
  enable_deletion_protection = false
}

resource "aws_alb_target_group" "target_group" {
  name     = "target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "${aws_vpc.vpc.id}"

  health_check {
    interval            = 30
    path                = "/"
    port                = "traffic-port"
    healthy_threshold   = 3
    unhealthy_threshold = 3
    timeout             = 5
    protocol            = "HTTP"
  }

  tags = "${var.aws_rsrc_tags}"
}

resource "aws_alb_listener" "http_listener" {
  load_balancer_arn = "${aws_lb.web_elb.arn}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = "${aws_alb_target_group.target_group.id}"
    type             = "forward"
  }
}

