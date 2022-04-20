terraform {
  required_providers {
    sparkpost = {
      source  = "SurveyMonkey/sparkpost"
      version = "~> 0.2.1"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.10"
    }
  }
  required_version = "1.1.7"
}

provider "sparkpost" {
  api_key = var.sparkpost_api_key

  # Sparkpost API url can be overriden to use the EU region
  base_url = "https://api.sparkpost.com"
}

provider "aws" {
  region = var.aws_region
}
