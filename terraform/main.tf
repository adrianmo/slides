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
  router_id = "99a9694a-12fc-44c6-8dc9-dc719c1ee3fa"
  subnet_id = "${openstack_networking_subnet_v2.subnet_1.id}"
}

resource "openstack_compute_floatingip_v2" "floatip_1" {
  pool = "public"
}

resource "openstack_compute_instance_v2" "instance_1" {
  name = "tf-instance-1"
  image_name = "ubuntu-16.04"
  flavor_name = "m1.medium"
  key_pair = "cat_kp"
  security_groups = ["default"]

  network {
    uuid = "${openstack_networking_network_v2.network_1.id}"
    floating_ip = "${openstack_compute_floatingip_v2.floatip_1.address}"
  }

  /*volume {
    volume_id = "${openstack_blockstorage_volume_v1.volume_1.id}"
  }*/
}

resource "openstack_compute_floatingip_v2" "floatip_2" {
  pool = "public"
}

resource "openstack_compute_instance_v2" "instance_2" {
  name = "tf-instance-2"
  image_name = "CentOS-7-x86_64-GenericCloud-1606"
  flavor_name = "v4.medium"
  key_pair = "cat_kp"
  security_groups = ["default"]

  block_device {
    boot_index = 0
    delete_on_termination = true
    destination_type = "local"
    source_type = "blank"
    volume_size = 8
  }

  network {
    uuid = "${openstack_networking_network_v2.network_1.id}"
    floating_ip = "${openstack_compute_floatingip_v2.floatip_2.address}"
  }
}
