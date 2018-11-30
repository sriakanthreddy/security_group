#provider information
provider "aws" {
region="us-east-1"
profile="default"
}

#Ec2 Configuration
resource "aws_instance" "server1" {
ami            ="ami-09479453c5cde9639"
instance_type  ="t2.micro"
key_name       ="ubuntu_key"
security_groups=["${aws_security_group.allow_all.name}"]
tags {
name ="helloworld"
}
}

#Security Group Creation
resource "aws_security_group" "allow_all" {
name   ="testing_sg"

ingress {
from_port  =0
to_port    =0
protocol   ="-1"
cidr_blocks=["0.0.0.0/0"]
}

egress {
from_port  =0
to_port    =0
protocol   ="-1"
cidr_blocks=["0.0.0.0/0"]
}
}
