terraform {
  required_providers {
    twc = {
      source = "tf.timeweb.cloud/timeweb-cloud/timeweb-cloud"
    }
  }
  required_version = ">= 0.13"
}

provider "twc" {
  token = var.twc_token
}

module "twc_cluster" {
  source           = "../../modules/cluster"
  
  # Передача значений переменных в модуль
  twc_token        = var.twc_token
  cluster_name     = var.cluster_name
  location         = var.location
  disk_type        = var.disk_type
  os_name          = var.os_name
  os_version       = var.os_version
  
  # Мастер-ноды
  master_count     = var.master_count
  master_cpu       = var.master_cpu
  master_ram       = var.master_ram
  master_disk      = var.master_disk

  # Клиент-ноды
  client_count     = var.client_count
  client_cpu       = var.client_cpu
  client_ram       = var.client_ram
  client_disk      = var.client_disk

  # Cloud-init
  cloud_init_master = var.cloud_init_master
  cloud_init_client = var.cloud_init_client
}