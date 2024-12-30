variable "twc_token" {
  description = "API Timeweb Cloud"
  type        = string
  sensitive   = true
}

variable "cluster_name" {
  description = "Название кластера"
  type        = string
}

variable "location" {
  description = "Локация для серверов"
  type        = string
  default     = "ru-1"
}

variable "disk_type" {
  description = "Тип диска для серверов (nvme, ssd, hdd)"
  type        = string
  default     = "nvme"
}

variable "os_name" {
  description = "Название операционной системы"
  type        = string
  default     = "ubuntu"
}

variable "os_version" {
  description = "Версия операционной системы"
  type        = string
  default     = "22.04"
}

variable "master_count" {
  description = "Количество мастер-нод"
  type        = number
  default     = 3
}

variable "master_cpu" {
  description = "Количество CPU для мастер-нод"
  type        = number
  default     = 2
}

variable "master_ram" {
  description = "Размер RAM (в МБ) для мастер-нод"
  type        = number
  default     = 2048
}

variable "master_disk" {
  description = "Размер диска (в МБ) для мастер-нод"
  type        = number
  default     = 10240
}

variable "client_count" {
  description = "Количество клиент-нод"
  type        = number
  default     = 5
}

variable "client_cpu" {
  description = "Количество CPU для клиент-нод"
  type        = number
  default     = 1
}

variable "client_ram" {
  description = "Размер RAM (в МБ) для клиент-нод"
  type        = number
  default     = 1024
}

variable "client_disk" {
  description = "Размер диска (в МБ) для клиент-нод"
  type        = number
  default     = 5120
}

variable "cloud_init_master" {
  description = "Скрипт инициализации для мастер-нод"
  type        = string
  default     = ""
}

variable "cloud_init_client" {
  description = "Скрипт инициализации для клиент-нод"
  type        = string
  default     = ""
}
