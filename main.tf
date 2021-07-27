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