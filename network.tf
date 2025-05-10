# 
resource "aws_key_pair" "shb-key" {
  key_name   = var.key_name
  public_key = file("${var.public_key_path}")
}

# key genrate commadn = ssh-keygen -t rsa -b 4096 -f ./id_rsa

resource "aws_security_group" "ec2_sg" {
  name        = "${var.instance_name}-sg"
  description = "Security group for ${var.instance_name}"

  dynamic "ingress" {
    for_each = [20, 80]
    iterator = port

    content {
      description = "Allow port"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags
}