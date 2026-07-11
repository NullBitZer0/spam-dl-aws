terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "spamshield"
}

variable "environment" {
  description = "Environment"
  type        = string
  default     = "dev"
}

variable "s3_bucket_name" {
  description = "S3 bucket name"
  type        = string
  default     = "spamshield-ai-models"
}

variable "sagemaker_instance_type" {
  description = "SageMaker instance type"
  type        = string
  default     = "ml.t2.medium"
}

variable "model_data_url" {
  description = "S3 URI of model tar.gz"
  type        = string
  default     = ""
}

locals {
  name_prefix = "${var.project_name}-${var.environment}"
}
