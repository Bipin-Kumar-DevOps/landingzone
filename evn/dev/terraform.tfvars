# Resource Group Variables
rg_map = {
  rg1 = {
    name     = "rg-frontend-prod-ci-01"
    location = "centralindia"
  }
  rg2 = {
    name     = "rg-backend-prod-ci-01"
    location = "southindia"
  }
  rg3 = {
    name     = "rg-database-prod-ci-01"
    location = "eastus"
  }
}

# Keyvault Variable

keyvault_map = {
  keyvault1 = {
    rg_name       = "rg-frontend-prod-ci-01"
    location      = "centralindia"
    keyvault_name = "keyvaut01"
  }

  keyvault2 = {
    rg_name       = "rg-backend-prod-ci-01"
    location      = "southindia"
    keyvault_name = "keyvaut02"
  }
  keyvault3 = {
    rg_name       = "rg-backend-prod-ci-01"
    location      = "southindia"
    keyvault_name = "keyvaut03"
  }
}

# Virtual Network Variables

vnet_map = {
  vnet1 = {
    name          = "frontend-vnet"
    location      = "centralindia"
    rg_name       = "rg-frontend-prod-ci-01"
    address_space = ["10.0.0.0/16"]
  }
  vnet2 = {
    name          = "backend-vnet"
    location      = "southindia"
    rg_name       = "rg-backend-prod-ci-01"
    address_space = ["192.168.0.0/16"]
  }
  vnet3 = {
    name          = "database-vnet"
    location      = "eastus"
    rg_name       = "rg-database-prod-ci-01"
    address_space = ["172.169.0.0/16"]
  }
}

# Subnet Variables

subnet_map = {
  subnet1 = {
    name             = "frontend-subnet-01"
    rg_name          = "rg-frontend-prod-ci-01"
    vnet_name        = "frontend-vnet"
    address_prefixes = ["10.0.1.0/24"]
  }
  subnet2 = {
    name             = "frontend-subnet-02"
    rg_name          = "rg-frontend-prod-ci-01"
    vnet_name        = "frontend-vnet"
    address_prefixes = ["10.0.2.0/24"]
  }
  subnet3 = {
    name             = "backend-subnet-01"
    rg_name          = "rg-backend-prod-ci-01"
    vnet_name        = "backend-vnet"
    address_prefixes = ["192.168.1.0/24"]
  }
  subnet4 = {
    name             = "backend-subnet-02"
    rg_name          = "rg-backend-prod-ci-01"
    vnet_name        = "backend-vnet"
    address_prefixes = ["192.168.2.0/24"]
  }
  subnet5 = {
    name             = "database-subnet-01"
    rg_name          = "rg-database-prod-ci-01"
    vnet_name        = "database-vnet"
    address_prefixes = ["172.169.1.0/24"]
  }
  subnet6 = {
    name             = "database-subnet-02"
    rg_name          = "rg-database-prod-ci-01"
    vnet_name        = "database-vnet"
    address_prefixes = ["172.169.2.0/24"]
  }
}

# Database Variables

db_map = {
  db1 = {
    sqlserver_name = "sqlservernetweb"
    rg_name        = "rg-database-prod-ci-01"
    location       = "eastus"
    sql_db_name    = "sql-db"
  }

}

# Bastion Variable

bastion_map = {
  bastion1 = {
    bastion_subnet_name = "AzureBastionSubnet"
    rg_name             = "rg-frontend-prod-ci-01"
    bastion_vnet        = "frontend-vnet"
    address_prefixes    = ["10.0.11.224/27"]
    pip_name            = "frontend-bastion-pip"
    location            = "centralindia"
    bastion_host_name   = "frontendbastion"
    config_name         = "frontend-config"
  }

  bastion2 = {
    bastion_subnet_name = "AzureBastionSubnet"
    rg_name             = "rg-backend-prod-ci-01"
    bastion_vnet        = "backend-vnet"
    address_prefixes    = ["192.168.11.224/27"]
    pip_name            = "backend-bastion-pip"
    location            = "southindia"
    bastion_host_name   = "backendbastion"
    config_name         = "backend-config"
  }

  # bastion3 = {
  #   rg_name           = "rg-database-prod-ci-01"
  #   bastion_vnet      = "database-vnet"
  #   address_prefixes  = ["172.169.11.224/27"]
  #   pip_name          = "database-bastion-pip"
  #   location          = "centralindia"
  #   bastion_host_name = "databasebastion"
  #   config_name       = "database-config"
  # }
}


# Linux Virtual Machine Variable

Linux_vm_map = {
  vm1 = {
    vm_name                   = "vm-frontend-01"
    rg_name                   = "rg-frontend-prod-ci-01"
    location                  = "centralindia"
    vm_size                   = "Standard_DS1_v2"
    allocation_method         = "Static"
    nic_name                  = "nic-frontend-prod-ci-01"
    ip_config_name            = "nic-frontend-01"
    data_name                 = "frontend-subnet-01"
    data_virtual_network_name = "frontend-vnet"
  } 
  vm2 = {
    vm_name                   = "vm-backend-02"
    rg_name                   = "rg-backend-prod-ci-01"
    location                  = "southindia"
    vm_size                   = "Standard_DS1_v2"
    allocation_method         = "Static"
    nic_name                  = "nic-backend-prod-ci-02"
    ip_config_name            = "nic-backend-01"
    data_name                 = "backend-subnet-01"
    data_virtual_network_name = "backend-vnet"
  } 
  vm3 = {
    vm_name                   = "vm-frontend-03"
    rg_name                   = "rg-frontend-prod-ci-01"
    location                  = "centralindia"
    vm_size                   = "Standard_DS1_v2"
    allocation_method         = "Static"
    nic_name                  = "nic-frontend-prod-ci-03"
    ip_config_name            = "nic-frontend-01"
    data_name                 = "frontend-subnet-01"
    data_virtual_network_name = "frontend-vnet"
  } 
}

# Windows Virtual Machine Variable

win_vm_map = {
  vm4 = {
    vm_name                   = "vm-backend-04"
    rg_name                   = "rg-backend-prod-ci-01"
    location                  = "southindia"
    vm_size                   = "Standard_DS1_v2"
    allocation_method         = "Static"
    nic_name                  = "nic-backend-prod-ci-04"
    ip_config_name            = "nic-backend-02"
    data_name                 = "backend-subnet-02"
    data_virtual_network_name = "backend-vnet"
   }
  vm5 = {
    vm_name                   = "vm-frontend-05"
    rg_name                   = "rg-frontend-prod-ci-01"
    location                  = "centralindia"
    vm_size                   = "Standard_DS1_v2"
    allocation_method         = "Static"
    nic_name                  = "nic-frontend-prod-ci-05"
    ip_config_name            = "nic-frontend-02"
    data_name                 = "frontend-subnet-02"
    data_virtual_network_name = "frontend-vnet"
   }
    vm6 = {
    vm_name                   = "vm-backend-06"
    rg_name                   = "rg-backend-prod-ci-01"
    location                  = "southindia"
    vm_size                   = "Standard_DS1_v2"
    allocation_method         = "Static"
    nic_name                  = "nic-backend-prod-ci-06"
    ip_config_name            = "nic-backend-04"
    data_name                 = "backend-subnet-02"
    data_virtual_network_name = "backend-vnet"
  }
}


lb_map = {
  lb01 = {
    lb_pip_name                 = "pip-lb-01"
    location                    = "centralindia"
    rg_name                     = "rg-frontend-prod-ci-01"
    lb_name                     = "frontend-lb-01"
    frontend_pip_name           = "frontend-pip-address-01"
    pip_sku                     = "Standard"
    lb_sku                      = "Standard"
    backend_pool_name           = "frontend-bkpool-01"
    vnet_name                   = "frontend-vnet"
    lb_bkpool-addresses_name-01 = "frontend-bkpool-addresses-01"
    lb_bkpool-addresses_name-02 = "frontend-bkpool-addresses-02"
    data_nic_name-01            = "nic-frontend-prod-ci-01"
    data_nic_name-02            = "nic-frontend-prod-ci-03"
  }
  lb02 = {
    lb_pip_name                 = "pip-lb-02"
    location                    = "southindia"
    rg_name                     = "rg-backend-prod-ci-01"
    lb_name                     = "backend-lb-01"
    frontend_pip_name           = "backend-pip-address-01"
    pip_sku                     = "Standard"
    lb_sku                      = "Standard"
    backend_pool_name           = "backend-bkpool-01"
    vnet_name                   = "backend-vnet"
    lb_bkpool-addresses_name-01 = "backend-bkpool-addresses-01"
    lb_bkpool-addresses_name-02 = "backend-bkpool-addresses-02"
    data_nic_name-01            = "nic-backend-prod-ci-04"
    data_nic_name-02            = "nic-backend-prod-ci-06"
  }
}

peering_map = {
  rg_name_01      = "rg-frontend-prod-ci-01"
  vnet_name_01    = "frontend-vnet"
  rg_name_02      = "rg-backend-prod-ci-01"
  vnet_name_02    = "backend-vnet"
  peering_name_01 = "frontend-to-backend-peer"
  peering_name_02 = "backend-to-frontend-peer"
}