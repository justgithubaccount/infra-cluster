# Вывод IP-адресов мастер-нод
output "master_ips" {
  value = module.twc_cluster.master_ips
}

# Вывод IP-адресов клиент-нод
output "client_ips" {
  value = module.twc_cluster.client_ips
}
