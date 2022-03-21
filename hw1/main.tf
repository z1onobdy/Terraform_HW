data "aws_vpc" "hw1" {
  default = true  

}

data "aws_subnet_ids" "hw1" {
  vpc_id = data.aws_vpc.hw1.id
}


data "aws_subnet" "hw1" {
  for_each = data.aws_subnet_ids.hw1.ids
  id = each.value
}

data "aws_security_groups" "hw1" {
  
}