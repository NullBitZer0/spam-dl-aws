output "s3_bucket_name" {
  description = "S3 bucket name"
  value       = aws_s3_bucket.model_bucket.id
}

output "sagemaker_role_arn" {
  description = "SageMaker execution role ARN"
  value       = aws_iam_role.sagemaker_role.arn
}

output "sagemaker_model_name" {
  description = "SageMaker model name"
  value       = aws_sagemaker_model.spam_model.name
}

output "sagemaker_endpoint_name" {
  description = "SageMaker endpoint name"
  value       = aws_sagemaker_endpoint.endpoint.name
}
