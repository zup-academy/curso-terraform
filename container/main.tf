resource "random_string" "random" {
  count   = var.count_stored
  length  = 6
  special = false
  upper   = false
}

resource "docker_container" "stack_container" {
  count = var.count_stored
  name  = join("-", [var.name_stored, terraform.workspace, random_string.random[count.index].result])
  image = var.image_stored

  # map
  ports {
    internal = var.internal_stored
    external = var.external_stored[count.index]
  }
}
