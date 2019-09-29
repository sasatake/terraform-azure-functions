resource "azurerm_cosmosdb_account" "functions_sample" {
  name                = "${var.prefix}-db"
  resource_group_name = "${var.resource_group_name}"
  location            = "${var.region}"
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"

  enable_automatic_failover = false

  consistency_policy {
    consistency_level = "Session"
  }

  geo_location {
    location          = "${var.region}"
    failover_priority = 0
  }
}
