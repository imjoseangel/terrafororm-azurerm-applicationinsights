#-------------------------------
# Local Declarations
#-------------------------------
locals {
  resource_group_name = element(coalescelist(data.azurerm_resource_group.rgrp[*].name, azurerm_resource_group.rg[*].name, [""]), 0)
  location            = element(coalescelist(data.azurerm_resource_group.rgrp[*].location, azurerm_resource_group.rg[*].location, [""]), 0)
}

#---------------------------------------------------------
# Resource Group Creation or selection - Default is "true"
#---------------------------------------------------------
data "azurerm_resource_group" "rgrp" {
  count = var.create_resource_group == false ? 1 : 0
  name  = var.resource_group_name
}

resource "azurerm_resource_group" "rg" {
  #ts:skip=AC_AZURE_0389 RSG lock should be skipped for now.
  count    = var.create_resource_group ? 1 : 0
  name     = lower(var.resource_group_name)
  location = var.location
  tags     = merge({ "ResourceName" = format("%s", var.resource_group_name) }, var.tags, )
}

#---------------------------------------------------------
# Log Analytics Creation or selection
#---------------------------------------------------------

resource "azurerm_log_analytics_workspace" "main" {
  name                = var.lname
  location            = local.location
  resource_group_name = local.resource_group_name
  retention_in_days   = var.retention_in_days
  sku                 = "PerGB2018"
  tags                = merge({ "ResourceName" = lower(var.name) }, var.tags, )
}

#---------------------------------------------------------
# Insights Creation or selection
#---------------------------------------------------------

resource "azurerm_application_insights" "main" {
  name                 = var.name
  location             = local.location
  resource_group_name  = local.resource_group_name
  application_type     = "web"
  daily_data_cap_in_gb = var.daily_data_cap_in_gb
  sampling_percentage  = var.sampling_percentage
  workspace_id         = azurerm_log_analytics_workspace.main.id

  tags = merge({ "ResourceName" = lower(var.name) }, var.tags, )
}
