output "ec2_public_ip" {
    description = "Public ip for ec2 instance"
    value = aws_instance.main.public_ip
}

output "instance_id" {
  description = "EC2 instance id"
}