resource "aws_instance" "hw2-ec2-instance" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = "t2.micro"
  subnet_id                   = " subnet-033bffb7002e3c554"
  associate_public_ip_address = true
  key_name                    = "test"
  security_groups             = ["sg-0f378f13cd7782263"]

  user_data = <<EOF
#! /bin/bash
yum update && yum upgrade -y
amazon-linux-extras install nginx1 -y
systemctl start nginx
systemctl enable nginx
EOF

}

resource "aws_db_instance" "hw2-rds-instance" {
  allocated_storage      = 10
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t2.micro"
  identifier             = "dbtest"
  db_name                = "db_test"
  username               = "user"
  password               = var.mysql_password
  parameter_group_name   = "default.mysql8.0"
  skip_final_snapshot    = true
  db_subnet_group_name   = "default-vpc-011e546db5e0d9b9f"
  vpc_security_group_ids = ["sg-0a8ed2a6e2990ec70"]
}

data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-*-x86_64-gp2"]
  }
  owners = ["amazon"]
}