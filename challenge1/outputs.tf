output "lb_url" {
  description = "URL of load balancer"
  value       = "http://${module.web.lb_dns}/"
}