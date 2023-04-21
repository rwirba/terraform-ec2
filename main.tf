provider "aws" {
  region = var.region
}

# Create a new security group for the instance
resource "aws_security_group" "my_security_group" {
  name_prefix = var.security_group_name

  # Allow traffic on port 22 (SSH), 80 (HTTP), and 8080 (Custom App) from your IP address
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip_address]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.my_ip_address]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = [var.my_ip_address]
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.security_group_name
  }
}

resource "aws_instance" "jenkins" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name 
  vpc_security_group_ids = [aws_security_group.my_security_group.id]
  tags = {
    Name = "jenkins"
  }
}

resource "aws_instance" "slave" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name             
  vpc_security_group_ids = [aws_security_group.my_security_group.id]
  tags = {
    Name = "slave"
  }
}

resource "aws_instance" "myapp" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name             
  vpc_security_group_ids = [aws_security_group.my_security_group.id]
  tags = {
    Name = "myapp"
  }
}
