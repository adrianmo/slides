output "ip" {
    value = "${aws_eip.eip_1.public_ip}"
}
