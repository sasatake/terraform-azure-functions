resource "azurerm_storage_account" "functions_sample" {
  name                     = "${replace(lower(var.prefix),"-","")}storage"
  resource_group_name      = "${var.resource_group_name}"
  location                 = "${var.location}"
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags {
    environment = "${var.env}"
  }
}
