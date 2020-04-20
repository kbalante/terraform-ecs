resource "aws_instance" "ec2_instance" {
  ami                    = "ami-008c5ba1857e0fdec"
  subnet_id              = "subnet-00f2624337a16d014"
  instance_type          = "t2.medium"
  iam_instance_profile   = "ecsInstanceRole"
  vpc_security_group_ids = ["sg-03a6ff8470e20ebdd"]
//  key_name               = "pnl-test"
  ebs_optimized          = "false"
  source_dest_check      = "false"
  user_data              = "${data.template_file.user_data.rendered}"
}

data "template_file" "user_data" {
  template = "${file("${path.module}/user_data.tpl")}"
}