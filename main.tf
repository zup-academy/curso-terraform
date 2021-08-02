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
  count   = 2
  length  = 6
  special = false
  upper   = false
}

resource "docker_image" "docusaurus-zup" {
  name = "public.ecr.aws/zup-academy/docusaurus-zup:latest"
}

# Start a container
resource "docker_container" "docusaurus-zup" {
  count = 2
  name  = join("-", ["docusaurus-zup", random_string.random[count.index].result])

  image = docker_image.docusaurus-zup.latest

  # map
  ports {
    internal = 3000
  }
}

output "container_name" {
  value = docker_container.docusaurus-zup[*].name

}

output "ip_address" {
  value = [for i in docker_container.docusaurus-zup[*]: join(":", [i.ip_address],i.ports[*]["external"])]

}

