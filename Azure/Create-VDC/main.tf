/* Backend */

terraform {
  backend "azurerm"{
    
  }
}

/* providers */
provider "azurerm" {
  version = "~>2.0"
  features {}
  subscription_id = var.subscriptionId
}