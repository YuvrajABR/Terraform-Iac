/* variables */

variable "subscriptionId" {
  type    = string
}
variable "rgname" {
  type    = string
}

variable "location" {
  type    = string
}

variable "vnet_cidr_range" {
  type    = string
}

variable "bke_subnet" {
  type    = string
}

variable "core_subnet" {
  type    = string
}

variable "dmz_subnet" {
  type    = string
}

variable "edg_subnet" {
  type    = string
}

/* tags */
variable "BUCode" {
  type    = string
}

variable "CostCenter" {
  type    = string
}

variable "DivCode" {
  type    = string
}

variable "AppCode" {
  type    = string
}
