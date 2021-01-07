variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "amis" {
  default = {
    us-east-2 = "ami-0a0ad6b70e61be944"
  }
}

variable "vm_type" {
  default = "t2.micro"
}

variable "vm_count" {
  default = "1"
}

variable "aws_region" {
  default = "us-east-2"
}
