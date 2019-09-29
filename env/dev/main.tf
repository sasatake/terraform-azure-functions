provider "azurerm" {}

resource "azurerm_resource_group" "dev" {
  name     = "${var.project_prefix}-${var.env}-rg"
  location = "${var.region}"

  tags {
    environment = "${var.env}"
  }
}

module "functions_sample" {
  source              = "../../modules/functions_sample/"
  env                 = "${var.env}"
  region              = "${var.region}"
  prefix              = "${var.project_prefix}-${var.env}"
  resource_group_name = "${azurerm_resource_group.dev.name}"
}
