variable "linux_name" {
  type    = map(string)
  default = {
    "ansible-c-vm18496" = "Standard_B1s"
    "ansible-c-vm28496" = "Standard_B1s"
  }
}