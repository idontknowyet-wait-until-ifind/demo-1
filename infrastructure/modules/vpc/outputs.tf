output "vpc_id" {
  value = aws_vpc.this.id
}

output "public_subnet_ids" {
  value = aws_subnet.public[*].id
  description = "IDs of public subnets"
}

output "private_subnet_ids" {
  value = aws_subnet.private[*].id
  description = "IDs of private subnets"
}
