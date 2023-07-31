
source "vsphere-iso" "centos" {
  CPUs                 = "${var.vm-cpu-num}"
  RAM                  = "${var.vm-mem-size}"
  RAM_reserve_all      = false
  boot_command         = ["<up><wait><tab><wait> text inst.ks=hd:fd0:/ks.cfg<enter><wait>"]
  boot_order           = "disk,cdrom,floppy"
  boot_wait            = "10s"
  floppy_files         = ["ks.cfg"]
  cluster              = "${var.cluster}"
  convert_to_template  = false
  datacenter           = "${var.datacenter}"
  datastore            = "${var.datastore}"
  disk_controller_type = ["pvscsi"]
  guest_os_type        = "centos7_64Guest"
  insecure_connection  = "true"
  iso_checksum         = "sha256:4B257CB5418E2BA44064121020DFE457FADAFF0D0C597BB2F4E7F7EEC4AEF58A"
  iso_paths            = ["${var.iso_paths}"]
  iso_urls             = ["${var.iso_urls}"]
  folder               = "VNL-Network"
  network_adapters {
    network      = "${var.network}"
    network_card = "vmxnet3"
  }
  notes            = "Build via Packer"
  shutdown_command = "echo \"${var.ssh_password}\"|sudo -S shutdown -P now"
  ssh_password     = "${var.ssh_password}"
  ssh_username     = "${var.ssh_username}"
  ssh_handshake_attempts = "100"	  
  ssh_timeout = "20m"
  storage {
    disk_size             = "${var.vm-disk-size}"
    disk_thin_provisioned = true
  }
  username       = "${var.username}"
  password       = "${var.password}"
  vcenter_server = "${var.vcenter_server}"
  vm_name        = "${var.vm_name}"
}


build {
  sources = ["source.vsphere-iso.centos"]
}
