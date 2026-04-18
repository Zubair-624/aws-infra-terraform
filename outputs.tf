output "ec2_public_ip" {
    description = "Public IP of the EC2 instance"
    value = module.compute.ec2_public_ip
}

output "instance_id" {
    description = "EC2 instance id"
    value = module.compute.instance_id
}

output "app_url" {
    description = "Application url"
    value = "ssh -i private-key.pem ec2-user${module.compute.ec2_public_ip}"
}