output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value = aws_instance.app_server.public_ip
}

output "ssh_command" {
  description = "SSH command to connect to the EC2 instance"
  value = "ssh -i ~/.ssh/devops_ec2_key ubuntu@${aws_instance.app_server.public_ip}"
}