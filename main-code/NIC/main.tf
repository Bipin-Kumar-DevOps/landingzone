# resource "azurerm_network_interface" "network-interface" {
#   for_each            = var.nic_map
#   name                = each.value.nic_name
#   location            = each.value.location
#   resource_group_name = each.value.rg_name

#   ip_configuration {
#     name                          = each.value.ip_config_name
#     subnet_id                     = data.azurerm_subnet.datasubnet[each.key].id
#     private_ip_address_allocation = "Dynamic"
#     # public_ip_address_id          = azurerm_public_ip.azurerm-pip[each.key].id
#   }
# }