resource "azurerm_service_plan" "asp" {
  name                = "${var.ais_commom_env_vars["org"]}-${var.ais_commom_env_vars["location_short"]}-${var.ais_commom_env_vars["env"]}-${var.ais_commom_env_vars["project"]}-asp-${format("%02d", var.ais_commom_env_vars["resource_number"])}"
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = var.os_type
  sku_name            = var.sku_size
  tags                = var.ais_tags
}

resource "azurerm_windows_web_app" "as" {
  name                = "${var.ais_commom_env_vars["org"]}-${var.ais_commom_env_vars["location_short"]}-${var.ais_commom_env_vars["env"]}-${var.ais_commom_env_vars["project"]}-as-${format("%02d", var.ais_commom_env_vars["resource_number"])}"
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = azurerm_service_plan.asp.id
  tags                = var.ais_tags
  https_only          = var.ais_commom_env_vars["location_short"] == "p" ? true : false

  site_config {
    ftps_state    = var.ftps_state
    http2_enabled = var.ais_commom_env_vars["location_short"] == "p" ? true : false

    application_stack {
      current_stack  = var.stack["current_stack"]
      dotnet_version = var.stack["dotnet_version"]
    }
  }

  #(Optional)
  connection_string {
    name  = var.connection_string_vars["connection_string_name"]
    type  = var.connection_string_vars["connection_string_type"]
    value = var.connection_string_vars["connection_string_value"]
  }
}