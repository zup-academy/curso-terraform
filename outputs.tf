output "container_name" {
  value = module.container[*].container_name
}

output "ip_address" {
  value = flatten(module.container[*].ip_address)
}