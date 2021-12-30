variable "project" {
  type    = string
  default = "demo"
}

variable "environment" {
  type    = string
  default = "qa"
}

variable "tags" {
  type    = map(string)
  default = {}
}