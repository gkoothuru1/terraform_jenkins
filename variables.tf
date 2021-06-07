variable "region" {
  description = "Location/region where the KeyVault will be created (for a list of regions see https://azure.microsoft.com/regions)"
  default     = "southcentralus"
}

variable "keyvault_name" {
  description = "Name of the keyvault to create"
  default     = "acctkeyvault"
}

variable "keyvault_sku" {
  description = "SKU of the keyvault to create"
  default     = "standard"
}

variable "resource_group_name" {
  description = "Default resource group name that the network will be created in."
  default     = "myapp-rg"
}

variable "tenant_id" {
  description = "The UID of the Azure Tenant where the KeyVault is deployed."
  default     = ""
}

variable "purge_protection_enabled" {
  description = "See https://www.terraform.io/docs/providers/azurerm/r/key_vault.html#purge_protection_enabled"
  default     = false
}

variable "soft_delete_enabled" {
  description = "See https://www.terraform.io/docs/providers/azurerm/r/key_vault.html#soft_delete_enabled"
  default     = false
}

variable "network_acls" {
  description = "Keyvault network ACL; there may be only 1 item in the set."
  default     = []
  type        = set(object({
    default_action             = string
    bypass                     = string
    ip_rules                   = list(string)
    virtual_network_subnet_ids = list(string)
  }))
}

variable "tags" {
  description = "Map of tags to add all keyvault resources"
  default     = {}
}

