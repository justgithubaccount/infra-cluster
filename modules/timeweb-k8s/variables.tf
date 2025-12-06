variable "cluster_name" {
  description = "Kubernetes cluster name"
  type        = string
}

variable "project_id" {
  description = "Timeweb project ID"
  type        = number
}

variable "network_id" {
  description = "Timeweb network ID"
  type        = string
}

variable "cluster_preset_id" {
  description = "Cluster preset ID (determines cluster resources)"
  type        = number
  default     = 1675
}

variable "node_preset_id" {
  description = "Node preset ID (determines node resources)"
  type        = number
  default     = 1683
}

variable "node_count" {
  description = "Number of worker nodes"
  type        = number
  default     = 3
}

variable "k8s_version" {
  description = "Kubernetes version"
  type        = string
  default     = "v1.34.2+k0s.0"
}

variable "network_driver" {
  description = "Network driver (calico, flannel, cilium)"
  type        = string
  default     = "calico"
}

variable "autoscaling" {
  description = "Enable node autoscaling"
  type        = bool
  default     = false
}
