output "vpc_id" {
    description = "ID for the vpc"
    value = aws_vpc.main.id
}

output "subnet_id" {
    description = "ID for the public subnet"
    value = aws_subnet.public.id
}

output "internet_gateway_id" {
    description = "ID for the Internet Gateway"
    value = aws_internet_gateway.main.id
}