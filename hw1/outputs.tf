output "vpc_default_id" {
  value = "ID: ${data.aws_vpc.hw1.id} \nName: ${data.aws_vpc.hw1.tags.Name}"
#   value = data.aws_vpc.hw1
  
}

output "subnet" {
  value = [ for s in data.aws_subnet.hw1 : s.cidr_block]
}

output "SG" {
  value = data.aws_security_groups.hw1.arns
}