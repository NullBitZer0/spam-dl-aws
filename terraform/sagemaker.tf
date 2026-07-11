resource "aws_sagemaker_model" "spam_model" {
  name               = "${local.name_prefix}-model"
  execution_role_arn = aws_iam_role.sagemaker_role.arn

  primary_container {
    image          = "763104351884.dkr.ecr.${var.aws_region}.amazonaws.com/huggingface-pytorch-inference:2.0.0-transformers4.30.0-cpu-py310-ubuntu20.04"
    model_data_url = var.model_data_url != "" ? var.model_data_url : "s3://${aws_s3_bucket.model_bucket.id}/model.tar.gz"
  }

  tags = {
    Name = "${local.name_prefix}-model"
  }
}

resource "aws_sagemaker_endpoint_configuration" "endpoint_config" {
  name = "${local.name_prefix}-endpoint-config"

  production_variants {
    variant_name           = "primary"
    model_name             = aws_sagemaker_model.spam_model.name
    instance_type          = var.sagemaker_instance_type
    initial_instance_count = 1
    initial_variant_weight = 1.0
  }

  tags = {
    Name = "${local.name_prefix}-endpoint-config"
  }
}

resource "aws_sagemaker_endpoint" "endpoint" {
  name = "${local.name_prefix}-endpoint"

  endpoint_config_name = aws_sagemaker_endpoint_configuration.endpoint_config.name

  tags = {
    Name = "${local.name_prefix}-endpoint"
  }
}
