resource "azurerm_batch_account" "mvp1" {
  name                                = var.batchacc_name
  resource_group_name                 = var.rg_name
  location                            = var.location
  pool_allocation_mode                = "BatchService"
  storage_account_id                  = var.storageacc_id
  storage_account_authentication_mode = "StorageKeys"

  tags = {
    env = "test"
  }
}