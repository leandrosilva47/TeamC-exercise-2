# Defines an Azure Resource Group for Key Vault
resource "azurerm_resource_group" "key_vault" {
  name     = "${var.prefix}-keyvault-RG"
  location = var.default_region
}

# Defines an Azure Key Vault
resource "azurerm_key_vault" "key_vault" {
  name                        = "${var.prefix}-keyvault"
  location                    = azurerm_resource_group.key_vault.location
  resource_group_name         = azurerm_resource_group.key_vault.name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = var.AzureKeyVault_SKU
  purge_protection_enabled    = true
}

