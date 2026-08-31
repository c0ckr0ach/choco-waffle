terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 5.92"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_key_pair" "devops_key" {
    key_name   = "devops_ec2_key"
    public_key = file(var.public_key_path)
}

# firewall rule to allow ssh access
resource "aws_security_group" "app_sg" {
    name = "devops_app_sg"
    description = "allow imbound ssh, http and outbound internet"

    # imbound rules
    ingress {
        description = "SSH access"
        from_port   = 22
        to_port     = 22
    }

    ingress {
        description = "Frontend application access"
        from_port   = 8080
        to_port     = 8080
    }

    # outbound rules
    egress {
        description = "Allow all outbound traffic"
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
