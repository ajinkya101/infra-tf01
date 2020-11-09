#Resources which will be created
module "rg" {
  source = "./rg"
}

resource "azurerm_network_security_group" "main" {
  name                = terraform.workspace
  location            = "East US"
  resource_group_name = "Ajinkya-RG2"

  security_rule {
    name                       = "port_80"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}