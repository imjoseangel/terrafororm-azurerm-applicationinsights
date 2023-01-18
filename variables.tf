variable "lname" {
  description = "Name of Azure Log Analytics service."
  type        = string
}

variable "name" {
  description = "Name of Azure Application Insights service."
  type        = string
}

variable "create_resource_group" {
  description = "Whether to create resource group and use it for all resources"
  default     = true
  type        = bool
}

variable "resource_group_name" {
  description = "A container that holds related resources for an Azure solution"
  default     = "rg-demo-westeurope-01"
  type        = string
}

variable "location" {
  description = "The location/region to keep all your resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
  default     = "westeurope"
  type        = string
}

variable "retention_in_days" {
  description = "(Optional) Specifies the retention period in days. Possible values are 30, 60, 90, 120, 180, 270, 365, 550 or 730. Defaults to 90."
  default     = 90
  type        = number
}

variable "daily_data_cap_in_gb" {
  description = "(Optional) Specifies the Application Insights component daily data volume cap in GB. Defaults to 100"
  default     = 100
  type        = number
}

variable "sampling_percentage" {
  description = "(Optional) Specifies the percentage of the data produced by the monitored application that is sampled for Application Insights telemetry. Defaults to 0."
  default     = 0
  type        = number
}

variable "tags" {
  description = "Tags to apply to all resources created."
  type        = map(string)
  default     = {}
}
