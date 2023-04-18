variable "region" {
  description = "The AWS region to use"
  default     = "us-east-1"
}

variable "ami" {
  description = "The AMI to use for the EC2 instance"
}

variable "instance_type" {
  description = "The type of EC2 instance to create"
  default     = "t2.micro"
}

variable "my_ip_address" {
  description = "The IP address to allow access from"
}

variable "key_name" {
  description = "The name of the key pair to use for SSH access"
}

variable "vpc_name" {
  description = "The name of the VPC"
  default     = "my-vpc"
}

variable "subnet_name" {
  description = "The name of the subnet"
  default     = "my-subnet"
}

variable "availability_zone" {
  description = "The availability zone to launch the subnet in"
}

variable "security_group_name" {
  description = "The name of the security group"
  default     = "my-security-group"
}

#variable "instance_name" {
#  description = "The name of the EC2 instance"
#}
