resource "azurerm_app_service_plan" "functions_sample" {
  name                = "${var.prefix}-service-plan"
  resource_group_name = "${var.resource_group_name}"
  location            = "${var.region}"
  kind                = "FunctionApp"

  tags {
    environment = "${var.env}"
  }

  sku {
    tier = "Dynamic"
    size = "Y1"
  }
}

resource "azurerm_function_app" "functions_sample" {
  name                      = "${var.prefix}-functions"
  resource_group_name       = "${var.resource_group_name}"
  location                  = "${var.region}"
  app_service_plan_id       = "${azurerm_app_service_plan.functions_sample.id}"
  storage_connection_string = "${azurerm_storage_account.functions_sample.primary_connection_string}"
  version                   = "~2"

  tags {
    environment = "${var.env}"
  }

  app_settings {
    "AppInsights_InstrumentationKey" = "${azurerm_application_insights.functions_sample.instrumentation_key}"
  }
}
