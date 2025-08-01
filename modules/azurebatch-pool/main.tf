resource "azurerm_batch_pool" "mvp1" {
  name                = "testaccpool"
  resource_group_name = var.rg_name
  account_name        = var.account_name
  display_name        = var.display_name
  vm_size             = var.vm_size
  node_agent_sku_id   = "batch.node.ubuntu 20.04"

  auto_scale {
    evaluation_interval = "PT15M"

    formula = <<EOF
      startingNumberOfVMs = 1;
      maxNumberofVMs = 25;
      pendingTaskSamplePercent = $PendingTasks.GetSamplePercent(180 * TimeInterval_Second);
      pendingTaskSamples = pendingTaskSamplePercent < 70 ? startingNumberOfVMs : avg($PendingTasks.GetSample(180 *   TimeInterval_Second));
      $TargetDedicatedNodes=min(maxNumberofVMs, pendingTaskSamples);
EOF

  }

  storage_image_reference {
    publisher = "microsoft-azure-batch"
    offer     = "ubuntu-server-container"
    sku       = "20-04-lts"
    version   = "latest"
  }

  container_configuration {
    type = "DockerCompatible"
    container_registries {
      registry_server = "docker.io"
      user_name       = "login"
      password        = "apassword"
    }
  }

  start_task {
    command_line       = "echo 'Hello World from $env'"
    task_retry_maximum = 1
    wait_for_success   = true

    common_environment_properties = {
      env = "TEST"
    }
    user_identity {
      auto_user {
        elevation_level = "NonAdmin"
        scope           = "Task"
      }
    }
  }

  certificate {
    id             = azurerm_batch_certificate.example.id
    store_location = "CurrentUser"
    visibility     = ["StartTask"]
  }
}


variable "batchjob-name" {}
variable "batchjob_id" {}
variable "batch_pool_id" {}