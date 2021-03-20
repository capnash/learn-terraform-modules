terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
  backend "s3" {
     profile  = "default"
     bucket   = "terraform-state-file-devops-nash"
     region   = "ap-southeast-2"
     key      = "aws/modules/terraform.tfstate"
  }
}

provider "aws" {
  profile = "default"
  region  = "ap-southeast-2"
}


module "website_s3_bucket" {
  source = "./modules/aws-s3-static-website-bucket"

  bucket_name = "devops-website-demo"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

/*
module "website_s3_bucket" {
  source = "git::https://github.com/freefox-do-terraform/terraform-modules.git//aws-s3-static-website-bucket?ref=v0.0.1"

  bucket_name = "devops-website-demo"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
*/
