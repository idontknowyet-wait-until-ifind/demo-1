#locals {
#  region        = "us-east-1"
#  environment   = "dev"
#  project       = "my-project"
#  bucket_prefix = "tfstate-${local.project}"
#}

locals {
  region       = "us-east-1"
  profile      = "localhost"
  endpoint_url = "http://localhost:4566"
}

# Optional: disable remote state in LocalStack dev mode
# remote_state {
#   backend = "s3"
#   config = {
#     bucket         = "my-tfstate-dev"
#     key            = "${path_relative_to_include()}/terraform.tfstate"
#     region         = local.region
#     encrypt        = false
#   }
# }

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite"
  contents  = <<EOF
provider "aws" {
  region                      = "us-east-1"
  access_key                  = "mock"
  secret_key                  = "mock"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  s3_use_path_style           = true

  endpoints {
  ec2 = "http://localhost:4566"
  rds = "http://localhost:4566"
    s3  = "http://localhost:4566"
    sts = "http://localhost:4566"
    iam = "http://localhost:4566"
    lambda = "http://localhost:4566"

    sqs = "http://localhost:4566"
  }
}
EOF
}
