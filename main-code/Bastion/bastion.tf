resource "azurerm_subnet" "bastion-subnet" {
  for_each = var.bastion_map
  name                 = each.value.bastion_subnet_name
  resource_group_name  = each.value.rg_name
  virtual_network_name = each.value.bastion_vnet
  address_prefixes     = each.value.address_prefixes
}

resource "azurerm_public_ip" "azurerm-pip" {
  for_each = var.bastion_map
  name                = each.value.pip_name
  resource_group_name = each.value.rg_name
  location            = each.value.location
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "example" {
  for_each = var.bastion_map
  name                = each.value.config_name
  location            = each.value.location
  resource_group_name = each.value.rg_name

  ip_configuration {
    name                 = each.value.config_name
    subnet_id            = azurerm_subnet.bastion-subnet[each.key].id
    public_ip_address_id = azurerm_public_ip.azurerm-pip[each.key].id
  }
}