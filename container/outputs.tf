output "container_name" {
  value = docker_container.docusaurus-zup.name
}

output "ip_address" {
  value = [for i in docker_container.docusaurus-zup[*] : join(":", [i.ip_address], i.ports[*]["external"])]
}