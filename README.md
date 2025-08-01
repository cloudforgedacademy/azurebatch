![PNG LOGO](https://github.com/user-attachments/assets/e0fba218-6059-4c69-9d46-c9354e392b93)

# 🚀                  Modular Azure Batch Deployment with Terraform

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
git clone https://github.com/your-org/terraform-azure-batch-modules.git
cd terraform-azure-batch-modules


##  Contact

**Oluseyi Sunny-Okundia**
Cloud Engineer | YouTube: [Cloudforged with Seyi](https://www.youtube.com/@cloudforgedwithseyi)
📧 [oluseyi@cloudforgedacademy.ca](mailto:oluseyi@cloudforgedacademy.ca)

---

## 📄 License

MIT License. Use at your own discretion.

```
