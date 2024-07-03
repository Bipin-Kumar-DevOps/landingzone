resource "azurerm_virtual_network_peering" "peering-01" {
  name                      = var.peering_map.peering_name_01
  resource_group_name       = var.peering_map.rg_name_01
  virtual_network_name      = data.azurerm_virtual_network.data-vnet-01.name
  remote_virtual_network_id = data.azurerm_virtual_network.data-vnet-02.id
}

resource "azurerm_virtual_network_peering" "peering-02" {
  name                      = var.peering_map.peering_name_02
  resource_group_name       = var.peering_map.rg_name_02
  virtual_network_name      = data.azurerm_virtual_network.data-vnet-02.name
  remote_virtual_network_id = data.azurerm_virtual_network.data-vnet-01.id
}