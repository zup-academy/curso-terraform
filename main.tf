resource "random_string" "random" {
  count   = local.container_count
  length  = 6
  special = false
  upper   = false
}

module "image" {
  source       = "./image"
  image_stored = var.image[terraform.workspace]

}

# Start a container
module "container" {
  source          = "./container"
  count           = local.container_count
  name_stored     = join("-", ["docusaurus-zup", terraform.workspace, random_string.random[count.index].result])
  image_stored    = module.image.image_module
  internal_stored = var.internal_port
  external_stored = lookup(var.external_port, terraform.workspace)[count.index]
}



