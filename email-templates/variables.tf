variable "sparkpost_api_key" {
  type = string
  description = "Sparkpost API key"
}

variable "aws_region" {
  default     = "us-east-1"
  type        = string
  description = "A valid AWS region to configure the underlying AWS SDK."
}
