resource "azurerm_network_interface" "network-interface" {
  for_each            = var.win_vm_map
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.rg_name

  ip_configuration {
    name                          = each.value.ip_config_name
    subnet_id                     = data.azurerm_subnet.datasubnet[each.key].id
    private_ip_address_allocation = "Dynamic"
    # public_ip_address_id          = azurerm_public_ip.azurerm-pip[each.key].id
  }
}

resource "azurerm_windows_virtual_machine" "win-vm" {
  for_each                        = var.win_vm_map
  name                            = each.value.vm_name
  resource_group_name             = each.value.rg_name
  location                        = each.value.location
  size                            = each.value.vm_size
  admin_username                  = data.azurerm_key_vault_secret.username.value
  admin_password                  = data.azurerm_key_vault_secret.passwd.value
  network_interface_ids           = [azurerm_network_interface.network-interface[each.key].id, ]

  os_disk {
    
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
  
  }
