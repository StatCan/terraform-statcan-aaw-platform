
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.0.0, < 3.0.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.0, < 3.0.0"
    }

    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.0.0, < 3.0.0"
    }
  }
}
