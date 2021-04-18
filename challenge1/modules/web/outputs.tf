output "lb_dns" {

  value       = aws_lb.lb.dns_name
}

output "tg1_arn" {
    value = aws_lb_target_group.web_tg_1.arn
}

output "tg2_arn" {
    value = aws_lb_target_group.web_tg_2.arn
}
