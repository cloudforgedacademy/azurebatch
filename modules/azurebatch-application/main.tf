resource "azurerm_batch_application" "mvp1" {
  name                = var.batchapp_name
  resource_group_name = var.rg_name
  account_name        = var.batchname
}