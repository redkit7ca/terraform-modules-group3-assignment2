variable "rg1" {}
variable "location" {default = "CanadaCentral"}

variable "public_ip_address_id" {}

variable "linux_nic" {}

variable "subnet_id_lb" {}

variable "linux_name" {
  type    = map(string)
  default = {}
}