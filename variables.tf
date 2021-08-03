variable "environment" {
    type = string
    default = "dev"
}

variable "image"{
    type = map
    default = {
        dev = "public.ecr.aws/zup-academy/docusaurus-zup:dev"
        qa = "public.ecr.aws/zup-academy/docusaurus-zup:qa"
    }
}

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
