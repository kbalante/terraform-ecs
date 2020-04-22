resource "aws_instance" "ec2_instance" {
  ami                    = var.ami
  subnet_id              = element(var.subnets, 0)
  instance_type          = var.instance_type
  iam_instance_profile   = "ecsInstanceRole"
  vpc_security_group_ids = var.security_groups
  ebs_optimized          = "false"
  source_dest_check      = "false"
  user_data              = data.template_file.user_data.rendered
}

data "template_file" "user_data" {
  template = "${file("${path.module}/user_data.tpl")}"
}

resource "aws_launch_configuration" "as_conf" {
  name          = "terraform-ecs-launch-config"
  image_id      = aws_instance.ec2_instance.ami
  instance_type = var.instance_type
  security_groups = var.security_groups
  iam_instance_profile = var.iam_instance_profile
  ebs_block_device {
    device_name = "/dev/xvdcz"
    volume_type = "gp2"
    volume_size = "22"
  }
}