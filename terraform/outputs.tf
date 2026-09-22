output "vpc_id" {
  description = "ID of the application VPC."
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "IDs of the public subnets."
  value = [
    aws_subnet.public_a.id,
    aws_subnet.public_b.id
  ]
}

output "private_subnet_ids" {
  description = "IDs of the private subnets."
  value = [
    aws_subnet.private_a.id,
    aws_subnet.private_b.id
  ]
}

output "s3_bucket_name" {
  description = "Name of the S3 artifact bucket."
  value       = aws_s3_bucket.artifacts.id
}

output "cicd_role_arn" {
  description = "ARN of the GitHub Actions CI/CD deployment role."
  value       = aws_iam_role.cicd_deployment.arn
}