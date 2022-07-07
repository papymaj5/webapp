variable "ais_commom_env_vars" {
  description = "Common variables details"
  type        = map(any)
}

variable "ais_tags" {
  description = "tags details"
  type        = map(any)
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "os_type" {
  description = "The O/S type for the App Services to be hosted in this plan."
  type        = string
  default     = "Windows"
  validation {
    condition     = var.os_type == "Windows" || var.os_type == "WindowsContainer"
    error_message = "The os_type is not either 'Windows' or 'WindowsContainer'"
  }
}

variable "sku_size" {
  description = "The SKU for the plan."
  type        = string
  default     = "S1"
}

variable "connection_string_vars" {
  type = map(any)
}

variable "stack" {
  description = "The Application Stack for the Windows Web App and the version."
  type        = map(any)
  default = {
    current_stack  = "dotnet"
    dotnet_version = "v6.0"
  }
}

variable "current_stack" {
  description = "The Application Stack for the Windows Web App."
  type        = string
  default     = "dotnet"
}

variable "ftps_state" {
  description = "The State of FTP / FTPS service."
  type        = string
  default     = "FtpsOnly"
  validation {
    condition     = var.ftps_state == "AllAllowed" || var.ftps_state == "FtpsOnly" || var.ftps_state == "Disabled"
    error_message = "The ftps_state possible values include: AllAllowed, FtpsOnly, Disabled"
  }
}