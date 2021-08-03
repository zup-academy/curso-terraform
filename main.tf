terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.14.0"
    }
  }
}


provider "docker" {
}


resource "random_string" "random" {
  count   = local.container_count
  length  = 6
  special = false
  upper   = false
}

resource "docker_image" "docusaurus-zup" {
  name = "public.ecr.aws/zup-academy/docusaurus-zup:latest"
}

# Start a container
resource "docker_container" "docusaurus-zup" {
  count = local.container_count
  name  = join("-", ["docusaurus-zup", random_string.random[count.index].result])

  image = docker_image.docusaurus-zup.latest

  # map
  ports {
    internal = var.internal_port[count.index]
    external = var.external_port[count.index]
  }
}



