variable "internal_port" {
  type    = list(number)
  default = ["3000"]

}
variable "external_port" {
  type    = list(number)
  default = ["3000","3001"]

}

locals {
    container_count = length(var.external_port)
}
