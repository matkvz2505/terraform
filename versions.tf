terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws",
      version = "5.42.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.3.2"
    }

    local = {
      source  = "hashicorp/local"
      version = "2.2.3"
    }

    null = {
      source  = "hashicorp/null"
      version = "3.1.1"
    }
  }

  # backend "s3" {
  #   bucket         = ""
  #   key            = ""
  #   encrypt        = true
  #   region         = ""
  #   profile        = ""
  # }

  required_version = "1.5.1"
}
