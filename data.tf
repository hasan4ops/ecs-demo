/*
# Get the latest ECS AMI
data "aws_ami" "linux" {
  most_recent = true
  owners = ["137112412989"]

  filter {
    name   = "name"
    values = ["amazon/amzn-ami-hvm-2018.03.0.20180811-x86_64-gp2-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
*/
# User data for ECS cluster
data "template_file" "ecs-cluster" {
  template = "${file("ecs-cluster.tpl")}"

  vars = {
    ecs_cluster = "${aws_ecs_cluster.demo.name}"
  }
}