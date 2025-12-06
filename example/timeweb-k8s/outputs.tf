output "cluster_id" {
  description = "ID кластера Kubernetes"
  value       = module.k8s.cluster_id
}

output "cluster_name" {
  description = "Название кластера Kubernetes"
  value       = module.k8s.cluster_name
}

output "kubeconfig" {
  description = "Kubeconfig для подключения к кластеру"
  value       = module.k8s.kubeconfig
  sensitive   = true
}

output "node_group_id" {
  description = "ID группы нод"
  value       = module.k8s.node_group_id
}
