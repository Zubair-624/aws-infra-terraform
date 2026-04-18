resource "tls_private_key" "main" {
    algorithm = "RSA"
    rsa_bits = 4096
}

resource "aws_key_pair" "main" {
    key_name = "${var.project_name}-${var.environemnt}-key"
    public_key = tls_private_key.main.public_key_openssh
}

resource "local_file" "main" {
    content = tls_private_key.main.private_key_pem
    filename = "${path.root}/private-key.pem"
    file_permission = "0600"
}

resource "aws_security_group" "main" {
    name = "${var.project_name}-${var.environemnt}-sg"
    description = "Security group for ec2 instance"
    vpc_id = var.vpc_id

    ingress {
        description = "SSH from my IP"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["${var.my_ip/32}"]
    }

    ingress {
        description = "HTTP form anywhere"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "HTTPS from anywhere"
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "${var.project_name}-${var.environemnt}-sg"
    }
}

resource "aws_instance" "main" {
    ami = "ami-0c02fb55956c7d316"
    instance_type = var.instance_type
    subnet_id = var.subnet_id
    vpc_security_group_ids = [aws_security_group.main.id]
    key_name = aws_key_pair.main.key_name

    user_data = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y docker
    systemctl start docker
    systemctl enable docker
    docker run -d -p 80:80 --name app nginx:latest
  EOF

  tags = {
    Name = "${var.project_name}-${var.environment}-ec2"
  }

}

