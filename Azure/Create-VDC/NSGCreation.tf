/*
      Creating NSG and security for BKE subnet
*/
resource "azurerm_network_security_group" "bke_nsg" {
  name                = "${var.BUCode}-${var.DivCode}-BKE-NSG"
  location            = var.location
  resource_group_name = var.rgname

  tags = {
      BUCode     = var.BUCode
      CostCenter = var.CostCenter
      DivCode    = var.DivCode
      AppCode    = var.AppCode
  }

  security_rule {
    name                       = "rdp_from_vnet_allow_in"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "VirtualNetwork"
    destination_address_prefix = "*"
    access                     = "Allow"
    priority                   = 101
    direction                  = "Inbound"
  }

  security_rule {
    name                       = "ssh_from_vnet_Allow_in"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "VirtualNetwork"
    destination_address_prefix = "*"
    access                     = "Allow"
    priority                   = 102
    direction                  = "Inbound"
  }
}
/*
      Creating NSG and security for core subnet
*/

resource "azurerm_network_security_group" "core_nsg" {
  name                = "${var.BUCode}-${var.DivCode}-CORE-NSG"
  location            = var.location
  resource_group_name = var.rgname

  tags = {
    BUCode     = var.BUCode
    CostCenter = var.CostCenter
    DivCode    = var.DivCode
    AppCode    = var.AppCode
  }
  security_rule {
    name                       = "rdp_allow_in"
    description                = "Allow RDP"
    protocol                   = "Tcp"
    source_port_range         = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "VirtualNetwork"
    destination_address_prefix = "*"
    access                     = "Allow"
    priority                   = 101
    direction                  = "Inbound"
  }

  security_rule {
    name                       = "ssh_Allow_in"
    description                = "Allow ssh"
    protocol                   = "Tcp"
    source_port_range         = "*"
    destination_port_range     = "22"
    source_address_prefix      = "VirtualNetwork"
    destination_address_prefix = "*"
    access                     = "Allow"
    priority                   = 102
    direction                  = "Inbound"
  }

}

/*
      Creating NSG and security for DMZ subnet
*/

resource "azurerm_network_security_group" "dmz_nsg" {
  name                = "${var.BUCode}-${var.DivCode}-DMZ-NSG"
  location            = var.location
  resource_group_name = var.rgname

  tags = {
      BUCode     = var.BUCode
      CostCenter = var.CostCenter
      DivCode    = var.DivCode
      AppCode    = var.AppCode
  }
  security_rule {
    name                       = "ssh_allow_vnet_in"
    description                = "Allow SSH from vnet"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "VirtualNetwork"
    destination_address_prefix = "*"
    access                     = "Allow"
    priority                   = 101
    direction                  = "Inbound"
  }

  security_rule {
    name                       = "rdp_rule_allow_vnet_in"
    description                = "Allow RDP from vnet"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "VirtualNetwork"
    destination_address_prefix = "*"
    access                     = "Allow"
    priority                   = 102
    direction                  = "Inbound"
  }
}

/*
      Creating NSG and security for EDG subnet
*/
resource "azurerm_network_security_group" "edg_nsg" {
  name                = "${var.BUCode}-${var.DivCode}-EDG-NSG"
  location            = var.location
  resource_group_name = var.rgname

  tags = {
    BUCode     = var.BUCode
    CostCenter = var.CostCenter
    DivCode    = var.DivCode
    AppCode    = var.AppCode
  }
  security_rule {
    name                       = "ntp_allow_vnet_out"
    description                = "Allow NTP out from Vnet from Vnet"
    protocol                   = "Udp"
    source_port_range          = "*"
    destination_port_range     = "123"
    source_address_prefix      = "VirtualNetwork"
    destination_address_prefix = "*"
    access                     = "Allow"
    priority                   = 300
    direction                  = "Outbound"
  }
  security_rule {
    name                       = "dns_allow_vnet_out"
    description                = "Allow DNS from Vnet"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "53"
    source_address_prefix      = "VirtualNetwork"
    destination_address_prefix = "*"
    access                     = "Allow"
    priority                   = 310
    direction                  = "Outbound"
  }
}