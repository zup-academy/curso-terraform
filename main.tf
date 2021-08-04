module "image" {
  source       = "./image"
  for_each     = local.image_type
  image_stored = each.value.image

}

# Start a container
module "container" {
  source          = "./container"
  count_stored    = each.value.container_count
  for_each        = local.image_type
  name_stored     = each.key
  image_stored    = module.image[each.key].image_module
  internal_stored = each.value.internal
  external_stored = each.value.external
}



