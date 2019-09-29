resource "azurerm_cosmosdb_account" "functions_sample" {
  name                = "${var.prefix}-db"
  resource_group_name = "${var.resource_group_name}"
  location            = "${var.location}"
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"

  enable_automatic_failover = false

  consistency_policy {
    consistency_level = "Session"
  }

  geo_location {
    location          = "${var.location}"
    failover_priority = 0
  }
}
