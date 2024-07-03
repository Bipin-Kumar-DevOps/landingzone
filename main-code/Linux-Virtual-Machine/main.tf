resource "azurerm_network_interface" "network-interface" {
  for_each            = var.Linux_vm_map
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

resource "azurerm_linux_virtual_machine" "example" {
  for_each                        = var.Linux_vm_map
  name                            = each.value.vm_name
  resource_group_name             = each.value.rg_name
  location                        = each.value.location
  size                            = each.value.vm_size
  disable_password_authentication = false
  admin_username                  = data.azurerm_key_vault_secret.username.value
  admin_password                  = data.azurerm_key_vault_secret.passwd.value
  network_interface_ids           = [azurerm_network_interface.network-interface[each.key].id, ]

  # admin_ssh_key {
  #   username   = "adminuser"
  #   public_key = file("~/.ssh/id_rsa.pub")
  # }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}

