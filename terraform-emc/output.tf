output "Floating IP 1" {
    value = "${openstack_compute_floatingip_v2.floatip_1.address}"
}

/*output "Floating IP 2" {
    value = "${openstack_compute_floatingip_v2.floatip_2.address}"
}*/
