terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.46.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}

resource "aws_instance" "tf-ec2" {
    ami = "ami-0b0dcb5067f052a63"
    instance_type = "t2.micro"
    key_name = "linux_lessons"

    tags =  {
      "Name" = "tf-ec2"
    }
}

resource "aws_s3_bucket" "tf-s3" {
    bucket = "ibrahim-tf-test-bucket-addwhateveryouwant"
}