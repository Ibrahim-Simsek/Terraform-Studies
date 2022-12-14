variable "ec2_name" {
  default = "ibrahim_ec2"
}

variable "ec2_type" {
  default = "t2.micro"
}

variable "ec2_ami" {
  default = "ami-0b0dcb5067f052a63"
}

variable "aws_s3_bucket" {
#  default = "ibrahim-tf-test-test-bucket-tflesson-newest"
}
 
 variable "num_of_buckets" {
  default = 2
}

variable "users" {
  default = ["halil1", "ibrahim2", "anthony3"]
}
