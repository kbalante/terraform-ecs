resource "aws_instance" "ec2_instance" {
  ami                    = "ami-008c5ba1857e0fdec"
  subnet_id              = "subnet-05252f85c65945218"
  instance_type          = "m5ad.large"
  iam_instance_profile   = "ecsInstanceRole"
  vpc_security_group_ids = ["sg-04a87c7dcdde7b2da"]
//  key_name               = "pnl-test"
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
  instance_type = "m5ad.large"
  security_groups = ["sg-04a87c7dcdde7b2da"]
  iam_instance_profile = "arn:aws:iam::798617457475:instance-profile/ecsInstanceRole"
  ebs_block_device {
    device_name = "/dev/xvdcz"
    volume_type = "gp2"
    volume_size = "22"
  }
}