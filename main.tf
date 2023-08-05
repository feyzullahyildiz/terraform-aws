provider "aws" {
  region     = "eu-central-1"
  access_key = "AKIA5PADAESCNVSEXMNP"
  secret_key = "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"
}

resource "aws_vpc" "first-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "production"
  }
}

resource "aws_subnet" "subnet-1" {
  vpc_id     = aws_vpc.first-vpc.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "prod-subnet"
  }
}

resource "aws_vpc" "second-vpc" {
  cidr_block = "10.1.0.0/16"
  tags = {
    Name = "dev"
  }
}

resource "aws_subnet" "subnet-2" {
  vpc_id     = aws_vpc.second-vpc.id
  cidr_block = "10.1.1.0/24"
  tags = {
    Name = "dev-subnet"
  }
}


# resource "aws_instance" "my-first-sever" {
#   ami           = "ami-04e601abe3e1a910f"
#   instance_type = "t2.micro"
#   tags = {
#     Name = "ubuntu"
#   }
# }
