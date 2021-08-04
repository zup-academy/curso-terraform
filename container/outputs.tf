output "stack_connections" {
  value = { for i in docker_container.stack_container[*] : i.name => join(":", [i.ip_address], i.ports[*]["external"]) }
}