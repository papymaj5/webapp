module "web_app" {
  source              = "../Modules/WinWebApp"
  ais_tags            = local.ais_tags
  ais_commom_env_vars = local.ais_commom_env_vars
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  os_type             = "Windows"
  sku_size            = "S1"

  stack = {
    current_stack  = "dotnet"
    dotnet_version = "v6.0"
  }

  connection_string_vars = {
    "connection_string_name"  = "Database"
    "connection_string_type"  = "SQLServer"
    "connection_string_value" = "Server=some-server.mydomain.com;Integrated Security=SSPI"
  }
}