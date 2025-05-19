output "ecs_cluster_id" {
  value = aws_ecs_cluster.main.id
}

output "alb_dns_name" {
  value = aws_lb.nginx.dns_name
}

# just for sure on apply on ecs, in fact - empty scale
output "autoscaling_policy_name" {
  value = aws_appautoscaling_policy.cpu_scale.name
}
