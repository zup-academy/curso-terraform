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

resource "docker_image" "docusaurus-zup" {
  name = "public.ecr.aws/zup-academy/docusaurus-zup:latest"
}

# Start a container
resource "docker_container" "docusaurus-zup" {
  name  = "docusaurus-zup"
  image = docker_image.docusaurus-zup.latest

  # map
  ports {
    internal = 3000
  }
}

output "container_name" {
  value = docker_container.docusaurus-zup.name
  
}

output "ip_address" {
  value = join(":", [docker_container.docusaurus-zup.ip_address, docker_container.docusaurus-zup.ports[0].external])

}