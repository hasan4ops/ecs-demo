output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}
output "public_subnets" {
  value = ["${aws_subnet.subnet_public1.id}"]
}
output "public_route_table_ids" {
  value = ["${aws_route_table.rtb_public.id}"]
}
output "public_instance_ip" {
  value = ["${aws_instance.sedinTechInstance.public_ip}"]
}
output "tg_arn"{
  value = "${aws_alb_target_group.target_group.id}"
}

output "alb_output" {
  value = "${aws_lb.web_elb.dns_name}"
}