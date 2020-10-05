/* creating virtual network and 4 subnets (BKE, CORE, DMZ, EDG) */

resource "azurerm_virtual_network" "vnet" {
  name                = "${var.BUCode}-${var.DivCode}-${var.AppCode}-YA-VNET"
  location            = var.location
  resource_group_name = var.rgname
  address_space       = [var.vnet_cidr_range]

  #BKE
  subnet {
    name           = "${var.BUCode}-${var.DivCode}-BKE-Subnet"
    address_prefix = var.bke_subnet
    security_group = azurerm_network_security_group.bke_nsg.id
  }
  #CORE
  subnet {
    name           = "${var.BUCode}-${var.DivCode}-CORE-Subnet"
    address_prefix = var.core_subnet
    security_group = azurerm_network_security_group.core_nsg.id
  }

  #DMZ
  subnet {
    name           = "${var.BUCode}-${var.DivCode}-DMZ-Subnet"
    address_prefix = var.dmz_subnet
    security_group = azurerm_network_security_group.dmz_nsg.id
  }
  #EDG
  subnet {
    name           = "${var.BUCode}-${var.DivCode}-EDG-Subnet"
    address_prefix = var.edg_subnet
    security_group = azurerm_network_security_group.edg_nsg.id
  }

  /* Tags vnet resource*/
  tags = {
    BUCode     = var.BUCode
    CostCenter = var.CostCenter
    DivCode    = var.DivCode
    AppCode    = var.AppCode
  }
}