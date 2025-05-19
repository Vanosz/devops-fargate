
output "vpc_id" {
  description = "id of the VPC"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "List of public subnet IDs"
  value       = module.vpc.public_subnet_ids
}


output "ecs_cluster_id" {
  description = "ID of ecs cluster"
  value       = module.ecs.ecs_cluster_id
}

output "alb_dns_name" {
  description = "Public DNS name of ALB"
  value       = module.ecs.alb_dns_name
}

# just for information about the apply on main
output "autoscaling_policy_name" {
  description = "Name of the ECS autoscaling policy"
  value       = module.ecs.autoscaling_policy_name
}
