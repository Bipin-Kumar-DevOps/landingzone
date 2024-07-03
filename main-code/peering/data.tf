data "azurerm_virtual_network" "data-vnet-01" {
  name                = var.peering_map.vnet_name_01
  resource_group_name = var.peering_map.rg_name_01
}

data "azurerm_virtual_network" "data-vnet-02" {
  name                = var.peering_map.vnet_name_02
  resource_group_name = var.peering_map.rg_name_02
}
