# Retrieve the IP address of the virtual machine
data "azurerm_virtual_network" "data-vnet" {
  for_each = var.lb_map
  name                = each.value.vnet_name
  resource_group_name = each.value.rg_name
}


data "azurerm_network_interface" "data-nic-01" {
  for_each = var.lb_map
  name                = each.value.data_nic_name-01
  resource_group_name = each.value.rg_name
}

data "azurerm_network_interface" "data-nic-02" {
  for_each = var.lb_map
  name                = each.value.data_nic_name-02
  resource_group_name = each.value.rg_name
}
