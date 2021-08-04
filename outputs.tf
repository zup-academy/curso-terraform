output "stack_connections" {
  value = [for i in module.container[*] : i]
}