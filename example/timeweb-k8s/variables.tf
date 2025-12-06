variable "twc_token" {
  description = "API Timeweb Cloud"
  type        = string
  sensitive   = true
}

variable "cluster_name" {
  description = "Название кластера Kubernetes"
  type        = string
}

variable "project_id" {
  description = "ID проекта Timeweb"
  type        = number
}

variable "network_id" {
  description = "ID сети Timeweb"
  type        = string
}

variable "cluster_preset_id" {
  description = "ID пресета кластера (определяет ресурсы кластера)"
  type        = number
  default     = 1675
}

variable "node_preset_id" {
  description = "ID пресета нод (определяет ресурсы нод)"
  type        = number
  default     = 1683
}

variable "node_count" {
  description = "Количество worker-нод"
  type        = number
  default     = 3
}

variable "k8s_version" {
  description = "Версия Kubernetes"
  type        = string
  default     = "v1.34.2+k0s.0"
}

variable "network_driver" {
  description = "Сетевой драйвер (calico, flannel, cilium)"
  type        = string
  default     = "calico"
}

variable "autoscaling" {
  description = "Включить автомасштабирование нод"
  type        = bool
  default     = false
}
