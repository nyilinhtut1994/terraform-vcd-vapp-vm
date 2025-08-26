terraform {
  required_providers {
    vcd = {
      source  = "vmware/vcd"
      version = "3.14.1"
    }
  }
}

provider "vcd" {
  user     = var.user
  password = var.password
  org      = var.org
  vdc      = var.vdc
  url      = var.url
  #allow_unverified_ssl = true
}


data "vcd_catalog" "cat-datacloud" {
  org  = var.org
  name = var.catalog_name
}

data "vcd_catalog_vapp_template" "mysql_template" {
  org        = var.org
  catalog_id = data.vcd_catalog.cat-datacloud.id
  name       = var.template_name
}

data "vcd_storage_profile" "sp" {
  org  = var.org
  vdc  = var.vdc
  name = var.storage_profile
}

resource "vcd_vapp" "test-2" {
  name = var.vapp_name
}

#  Attach the existing Organization VDC Network to the vApp
resource "vcd_vapp_org_network" "vapp_network_attachment" {
  vapp_name        = vcd_vapp.test-2.name
  org_network_name = var.org_network_name
}

resource "vcd_vapp_vm" "test_vm" {
  name             = var.vm_name
  vapp_name        = vcd_vapp.test-2.name
  vapp_template_id = data.vcd_catalog_vapp_template.mysql_template.id
  cpus             = var.cpus
  memory           = var.memory # Memory in MB
  storage_profile  = data.vcd_storage_profile.sp.name
  power_on         = true

  network {
    name               = vcd_vapp_org_network.vapp_network_attachment.org_network_name
    type               = "org" #Terraform to attach the VM to a pre-existing network that is managed at the Organization VDC level. vapp is only for vapp.
    ip_allocation_mode = "MANUAL"
    ip                 = var.ip
    is_primary         = true
  }

  depends_on = [
    vcd_vapp_org_network.vapp_network_attachment
  ]

}