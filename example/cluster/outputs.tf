output "master_ips" {
  value = module.twc_cluster.master_ips
}

output "client_ips" {
  value = module.twc_cluster.client_ips
}
