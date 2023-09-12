terraform {
  required_providers {
    phpipam = {
      source  = "lord-kyron/phpipam"
    }
  }
}

data "phpipam_subnet" "subnet_v4" {
  count           = var.subnet_v4 == null ? 0 : 1
  subnet_address  = split("/", var.subnet_v4)[0]
  subnet_mask     = split("/", var.subnet_v4)[1]
}

resource "phpipam_first_free_address" "addresses_v4" {
  count           = var.subnet_v4 == null ? 0 : var.address_count
  subnet_id       = data.phpipam_subnet.subnet_v4[0].subnet_id
  description     = length(var.address_description) > count.index ? var.address_description[count.index] : var.address_default_description
  hostname        = length(var.address_hostname) > count.index ? var.address_hostname[count.index] : null

  lifecycle {
    ignore_changes = [
      subnet_id,
    ]
  }
}

data "phpipam_subnet" "subnet_v6" {
  count           = var.subnet_v6 == null ? 0 : 1
  subnet_address  = split("/", var.subnet_v6)[0]
  subnet_mask     = split("/", var.subnet_v6)[1]
}

resource "phpipam_first_free_address" "addresses_v6" {
  count           = var.subnet_v6 == null ? 0 : var.address_count
  subnet_id       = data.phpipam_subnet.subnet_v6[0].subnet_id
  description     = length(var.address_description) > count.index ? var.address_description[count.index] : var.address_default_description
  hostname        = length(var.address_hostname) > count.index ? var.address_hostname[count.index] : null

  lifecycle {
    ignore_changes = [
      subnet_id,
    ]
  }
}
