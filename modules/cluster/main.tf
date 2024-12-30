terraform {
  required_providers {
    twc = {
      source = "tf.timeweb.cloud/timeweb-cloud/timeweb-cloud"
    }
  }
}

provider "twc" {
  token = var.twc_token
}

# Динамическое получение configurator_id
data "twc_configurator" "configurator" {
  location  = var.location
  disk_type = var.disk_type
}

# Динамическое получение os_id
data "twc_os" "os" {
  name    = var.os_name
  version = var.os_version
}

# Создание мастер-нод
resource "twc_server" "masters" {
  count = var.master_count

  name = "${var.cluster_name}-master-${count.index}"
  os_id = data.twc_os.os.id

  configuration {
    configurator_id = data.twc_configurator.configurator.id
    cpu  = var.master_cpu
    ram  = var.master_ram
    disk = var.master_disk
  }

  cloud_init = var.cloud_init_master
}

# Создание клиент-нод
resource "twc_server" "clients" {
  count = var.client_count

  name = "${var.cluster_name}-client-${count.index}"
  os_id = data.twc_os.os.id

  configuration {
    configurator_id = data.twc_configurator.configurator.id
    cpu  = var.client_cpu
    ram  = var.client_ram
    disk = var.client_disk
  }

  cloud_init = var.cloud_init_client
}
