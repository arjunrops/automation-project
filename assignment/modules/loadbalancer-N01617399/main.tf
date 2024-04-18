resource "azurerm_public_ip" "lb_public_ip" {
  name                = "lb-public-ip"
  location            = var.location
  resource_group_name = var.resource_group
  allocation_method   = "Static"
}


resource "azurerm_lb" "load_balancer" {
  name                = var.lb_name
  location            = var.location
  resource_group_name = var.resource_group
  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.lb_public_ip.id
  }
  tags = var.common_tags
}

resource "azurerm_lb_rule" "httpd_rule" {
  loadbalancer_id                = azurerm_lb.load_balancer.id
  name                           = "LBRule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "PublicIPAddress"
}

resource "azurerm_lb_backend_address_pool" "backend_pool" {
  name            = "backend-pool"
  loadbalancer_id = azurerm_lb.load_balancer.id
}


resource "azurerm_network_interface_backend_address_pool_association" "nic_backend_association" {
  count                   = length(var.vm_nics)
  network_interface_id    = var.vm_nics[count.index]
  ip_configuration_name   = "n01617399-u-vm1-ipconfig-${count.index + 1}"
  backend_address_pool_id = azurerm_lb_backend_address_pool.backend_pool.id
 }
