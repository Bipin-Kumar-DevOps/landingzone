data "azurerm_key_vault" "keyvault" {
  for_each = var.keyvault_map
  name                = each.value.keyvault_name
  resource_group_name = each.value.rg_name
}

data "azurerm_key_vault_secret" "username" {
  for_each = var.keyvault_map
  name         = "username"
  key_vault_id = data.azurerm_key_vault.keyvault[each.key].id
}

data "azurerm_key_vault_secret" "passwd" {
  for_each = var.keyvault_map
  name         = "password"
  key_vault_id = data.azurerm_key_vault.keyvault[each.key].id
}
