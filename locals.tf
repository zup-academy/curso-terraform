locals {
  image_type = {
    docusaurus = {
      container_count = length(var.external_port["docusaurus"][terraform.workspace])
      image           = var.image["docusaurus"][terraform.workspace]
      internal        = 3000
      external        = var.external_port["docusaurus"][terraform.workspace]
    }
    redis = {
      container_count = length(var.external_port["redis"][terraform.workspace])
      image           = var.image["redis"][terraform.workspace]
      internal        = 6379
      external        = var.external_port["redis"][terraform.workspace]
    }
  }
}