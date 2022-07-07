# Output for App service and App service Plan
output "service_plan_name" {
  value = azurerm_service_plan.asp.name
}

output "app_service_name" {
  value = azurerm_windows_web_app.as.name
}