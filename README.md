![PNG LOGO](https://github.com/user-attachments/assets/e0fba218-6059-4c69-9d46-c9354e392b93)


````markdown
# 🚀 Modular Azure Batch Deployment with Terraform

This project uses **Terraform modules** to deploy a complete Azure Batch environment. Each component—such as the Batch Account, Jobs, Applications, Certificates, Pools, and Storage Account—is managed independently through reusable Terraform modules.

---

## 📦 Modules Overview

The following modules are used in this deployment:

- `resource_group` – Creates the Azure Resource Group.
- `storage_account` – Deploys a Storage Account linked to the Batch Account.
- `batch_account` – Creates the Azure Batch Account.
- `batch_application` – Defines Batch applications and packages.
- `batch_certificate` – Uploads certificates for secure pool communication.
- `batch_pool` – Provisions pools of compute nodes.
- `batch_job` – Configures jobs and tasks submitted to the pool.

---

## 🧱 Prerequisites

- Terraform >= 1.3
- Azure CLI (`az login`)
- Azure Subscription with appropriate permissions
- A service principal (if running in CI/CD)

---

## 🔧 How to Use

### 1. Clone the Repo

```bash
git https://github.com/cloudforgedacademy/azurebatch.git
cd terraform-azure-batch-modules
````

### 2. Configure Variables

Edit the `terraform.tfvars` file or pass variables using the CLI. Example:

```hcl
location            = "Canada Central"
resource_group_name = "rg-batch"
batch_account_name  = "batchaccountdemo"
storage_account_name = "batchstoragedemo"
```

### 3. Initialize Terraform

```bash
terraform init
```

### 4. Review Deployment Plan

```bash
terraform plan
```

### 5. Apply Deployment

```bash
terraform apply
```

---

## 📁 Directory Structure

```
.
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
├── modules/
│   ├── batch_account/
│   ├── batch_application/
│   ├── batch_certificate/
│   ├── batch_job/
│   ├── batch_pool/
│   └── storage_account/
```

---

## 📘 Example: Using the Modules

Here’s how you might use the modules in `main.tf`:

```hcl
module "resource_group" {
  source = "./modules/resource_group"
  name   = var.resource_group_name
  location = var.location
}

module "storage" {
  source              = "./modules/storage_account"
  name                = var.storage_account_name
  resource_group_name = module.resource_group.name
  location            = var.location
}

module "batch" {
  source              = "./modules/batch_account"
  name                = var.batch_account_name
  resource_group_name = module.resource_group.name
  location            = var.location
  storage_account_id  = module.storage.id
}

# Add additional modules similarly for application, certificate, pool, and job
```

---

## 🔐 Security Best Practices

* Mark sensitive variables (e.g., certificate paths or secrets) as `sensitive = true`.
* Use Key Vault to store and retrieve certificates and secrets.
* Restrict network access to the storage and batch accounts as needed.

---

## 📚 References

* [Azure Batch Documentation](https://learn.microsoft.com/en-us/azure/batch/)
* [Terraform Registry - AzureRM](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)

---

##  Contact

**Oluseyi Sunny-Okundia**
Cloud Engineer | YouTube: [Cloudforged with Seyi](https://www.youtube.com/@cloudforgedwithseyi)
📧 [oluseyi@cloudforgedacademy.ca](mailto:oluseyi@cloudforgedacademy.ca)

---

## 📄 License

MIT License. Use at your own discretion.
