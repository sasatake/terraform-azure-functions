resource "azurerm_application_insights" "functions_sample" {
  name                = "${var.prefix}-insights"
  resource_group_name = "${var.resource_group_name}"
  location            = "${var.region}"
  application_type    = "Web"

  tags {
    environment = "${var.env}"
  }
}
