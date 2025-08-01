resource "azurerm_batch_job" "mvp1" {
  name          = var.batchjob-name
  batch_pool_id = var.batch_pool_id
}