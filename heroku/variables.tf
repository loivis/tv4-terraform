### variables

variable "name" {}

variable "buildpacks" {
  default = ["https://github.com/TV4/go-binary-buildpack"]
  type    = "list"
}

variable "deployer" {
  default = "bb-services-deploy@b17g.services"
}

variable "domain_name" {
  default = "b17g.services"
}

variable "region" {
  default = "eu"
}

variable "stack" {
  default = "heroku-18"
}
