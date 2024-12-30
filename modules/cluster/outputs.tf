output "master_ips" {
  description = "IP-адреса мастер-нод"
  value       = twc_server.masters[*].main_ipv4
}

output "client_ips" {
  description = "IP-адреса клиент-нод"
  value       = twc_server.clients[*].main_ipv4
}
