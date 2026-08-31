variable "aws_region" {
    description = "The AWS region to deploy resources in"
    type = string
    default = "us-east-1"
}

variable "instance_type" {
    description = "type of ec2 instance to launch"
    type = string
    default = "t3.micro"
}

variable "public_key_path" {
    description = "path to SSH public key"
    type = string
    default = "~/.ssh/devops_ec2_key.pub"
}