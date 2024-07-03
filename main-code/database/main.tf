resource "azurerm_mssql_server" "sql-server" {
  for_each                     = var.db_map
  name                         = each.value.sqlserver_name
  resource_group_name          = each.value.rg_name
  location                     = each.value.location
  version                      = "12.0"
  administrator_login          = "azureadmin"
  administrator_login_password = "admin@12345"
}

resource "azurerm_mssql_database" "sqldb" {
  for_each       = var.db_map
  name           = each.value.sql_db_name
  server_id      = azurerm_mssql_server.sql-server[each.key].id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = 250
  read_scale     = true
  sku_name       = "P1"
  zone_redundant = false
  enclave_type   = "VBS"

  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = true
  }
}