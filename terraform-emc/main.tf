resource "openstack_networking_network_v2" "network_1" {
  name = "tf-network_1"
  admin_state_up = "true"
}

resource "openstack_networking_subnet_v2" "subnet_1" {
  name = "tf-subnet_1"
  network_id = "${openstack_networking_network_v2.network_1.id}"
  cidr = "192.168.199.0/24"
  ip_version = 4
}

resource "openstack_networking_router_interface_v2" "router_interface_1" {
  region = ""
  router_id = "357081c2-31db-4dbd-a9bd-1753d01cc2fa"
  subnet_id = "${openstack_networking_subnet_v2.subnet_1.id}"
}

resource "openstack_compute_floatingip_v2" "floatip_1" {
  pool = "public"
}

resource "openstack_compute_instance_v2" "instance_1" {
  name = "tf-instance-1"
  image_name = "Ubuntu 14.04"
  flavor_name = "m1.medium"
  key_pair = "CAT-Keys"
  security_groups = ["default"]

  network {
    uuid = "${openstack_networking_network_v2.network_1.id}"
    floating_ip = "${openstack_compute_floatingip_v2.floatip_1.address}"
  }
}




resource "openstack_compute_floatingip_v2" "floatip_2" {
  pool = "public"
}

resource "openstack_compute_instance_v2" "instance_2" {
  name = "tf-instance-2"
  image_name = "cirros"
  flavor_name = "m1.small"
  key_pair = "CAT-Keys"
  security_groups = ["default"]

  network {
    uuid = "${openstack_networking_network_v2.network_1.id}"
    floating_ip = "${openstack_compute_floatingip_v2.floatip_2.address}"
  }
}
