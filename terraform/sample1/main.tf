provider "aws" {
  access_key = "AKIA2IMV72H2R566RNZD"
  secret_key = "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"
  region = "us-east-1"
}

resource "aws_instance" "Udacity" {
  ami = "ami-0323c3dd2da7fb37d"
  instance_type = "t2.micro"
} 