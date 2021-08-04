resource "random_string" "random" {
  count   = local.container_count
  length  = 6
  special = false
  upper   = false
}

resource "docker_image" "docusaurus-zup" {
  name = lookup(var.image, terraform.workspace)
}

# Start a container
resource "docker_container" "docusaurus-zup" {
  count = local.container_count
  name  = join("-", ["docusaurus-zup", terraform.workspace, random_string.random[count.index].result])

  image = docker_image.docusaurus-zup.latest

  # map
  ports {
    internal = var.internal_port
    external = lookup(var.external_port, terraform.workspace)[count.index]
  }
}



