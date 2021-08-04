variable "image" {
  type = map(any)
  default = {
    docusaurus = {
      dev = "public.ecr.aws/zup-academy/docusaurus-zup:dev"
      qa  = "public.ecr.aws/zup-academy/docusaurus-zup:qa"
    }
    redis = {
      dev = "redis:alpine"
      qa  = "redis:buster"
    }
  }
}

variable "internal_port" {
  type    = number
  default = 3000
}

variable "external_port" {
  type = map(any)
  default = {
    docusaurus = {
      dev = [3000, 3001]
      qa  = [4000, 4001]
    }
    redis = {
      dev = [6379]
      qa  = [7379]
    }
  }
}
