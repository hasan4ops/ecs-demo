resource "aws_instance" "sedinTechInstance" {
  ami           = "ami-0ff8a91507f77f867"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.subnet_public1.id}"
  vpc_security_group_ids = ["${aws_security_group.lb_sg.id}"]
  key_name = "${aws_key_pair.ec2key.key_name}"
  tags          = "${var.aws_rsrc_tags}"
}
