output "id" {
  value       = azurerm_application_insights.main.id
  description = "The ID of the Application Insights component."
}

output "instrumentation_key" {
  value       = azurerm_application_insights.main.instrumentation_key
  sensitive   = true
  description = "The Instrumentation Key for this Application Insights component. (Sensitive)"
}

output "app_id" {
  value       = azurerm_application_insights.main.app_id
  description = "The App ID associated with this Application Insights component."
}

output "name" {
  value       = azurerm_application_insights.main.name
  description = "The name of the Application Insights component."
}

output "connection_string" {
  sensitive   = true
  value       = azurerm_application_insights.main.connection_string
  description = "The Connection String for this Application Insights component. (Sensitive)"
}
