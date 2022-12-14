terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.46.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}

locals {
  mytag = "ibrahim-localname"
}

resource "aws_instance" "tf-ec2" {
  ami = var.ec2_ami
  # ami = "ami-08c40ec9ead489470"
  instance_type = var.ec2_type
  key_name      = "linux_lessons"
  tags = {
    "Name" = "${local.mytag}-come from locals"
  }
}

resource "aws_s3_bucket" "tf-s3" {
  # bucket = "${var.aws_s3_bucket}-${count.index}"
  # count = var.num_of_buckets != 0 ? var.num_of_buckets : 3
  # tags = {
  #   Name = "${local.mytag}-come from locals"
  # }
  for_each = toset(var.users)
  bucket = "tf-s3-bucket-${each.value}"
}

resource "aws_iam_user" "new_users" {
  for_each = toset(var.users)
  name = each.value
}

output "tf_example_private_ip" {
  value = aws_instance.tf-ec2.private_ip
}

output "tf-instance-public-ip" {
  value = aws_instance.tf-ec2.public_ip
}

output "tf-s3-bucket-data" {
  value = values(aws_s3_bucket.tf-s3)[*].region
}

output "s3_bucket_name" {
  value = values(aws_s3_bucket.tf-s3)[*].bucket
}

output "uppercase_user" {
  value = [for user in var.users : upper(user) if length(user) > 6]
}