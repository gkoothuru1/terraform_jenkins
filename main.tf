resource "azurerm_key_vault" "keyvault" {
  name                     = var.keyvault_name
  location                 = var.region
  resource_group_name      = var.resource_group_name
  tenant_id                = var.tenant_id

  sku_name                 = var.keyvault_sku

  purge_protection_enabled = var.purge_protection_enabled
  soft_delete_enabled      = var.soft_delete_enabled

  tags                     = var.tags

  dynamic "network_acls" {
    for_each = var.network_acls

    content {
      default_action             = network_acls.value["default_action"]
      bypass                     = network_acls.value["bypass"]
      ip_rules                   = network_acls.value["ip_rules"]
      virtual_network_subnet_ids = network_acls.value["virtual_network_subnet_ids"]
    }
  }
}

