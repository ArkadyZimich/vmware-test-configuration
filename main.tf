provider "vsphere" {
  user           = "${var.vsphere_user}"
  password       = "${var.vsphere_password}"
  vsphere_server = "${var.vsphere_server}"
 
  allow_unverified_ssl = true
}
 
data "vsphere_datacenter" "dc" {
  name = "mrgspbDC"
}
 
data "vsphere_datastore" "datastore" {
  name          = "LF1"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}
 
data "vsphere_compute_cluster" "cluster" {
  name          = "HA1Cluster"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}
 
data "vsphere_network" "network" {
  name          = "testnw"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}
 
data "vsphere_virtual_machine" "template" {
  name          = "BaseTemplate-Ubuntu-v.1.2"
  datacenter_id = "${data.vsphere_datacenter.dc.id}" 
