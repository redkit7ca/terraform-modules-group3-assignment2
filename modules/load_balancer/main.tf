resource "azurerm_public_ip" "lb_ip" {
  name                = "PublicIPForLB"
  location            = var.location
  resource_group_name = var.rg1
  allocation_method   = "Static"
  domain_name_label   = var.rg1
}


resource "azurerm_lb" "assignment2lb" {
  name = "assignment2-lb"
  location = var.location
  resource_group_name = var.rg1

  frontend_ip_configuration {
      name = "PublicIPAddress"
      public_ip_address_id = azurerm_public_ip.lb_ip.id
  }
}

resource "azurerm_lb_backend_address_pool" "bpepool" {
  resource_group_name = var.rg1
  loadbalancer_id     = azurerm_lb.assignment2lb.id
  name                = "BackEndAddressPool"
}

resource "azurerm_network_interface_backend_address_pool_association" "lb_pool_association" {
  for_each = var.linux_name
  name = each.key  
  network_interface_id    = [azurerm_network_interface.linux_nic[each.key].id] // network_interface_id name needed. unfinished
  # ip_configuration_name   = "testconfiguration1"
  ip_configuration_name   = "${each.key}-ip-config"
  backend_address_pool_id = azurerm_lb_backend_address_pool.bpepool.id
}

resource "azurerm_lb_rule" "lb_rule" {
  resource_group_name            = var.rg1
  loadbalancer_id                = azurerm_lb.assignment2lb.id
  name                           = "LBRule"
  protocol                       = "Tcp"
  frontend_port                  = 3389
  backend_port                   = 3389
  frontend_ip_configuration_name = "PublicIPAddress" // PublicIPAddress name needed. unfinished.
}

resource "azurerm_lb_probe" "lb_prob" {
  resource_group_name = var.rg1
  loadbalancer_id     = azurerm_lb.assignment2lb.id
  name                = "ssh-running-probe"
  port                = 22
}