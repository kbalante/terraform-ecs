variable "vpc_id" {
  default = "vpc-00686b018d0440e2d"
}

variable "subnets" {
  default = ["subnet-0766df91ff3c79890", "subnet-023363581fe4adbef"]
}

variable "security_groups" {
  default = ["sg-0fd34549782cb98b6"]
}

variable "instance_type" {
  default = "m5ad.large"
}