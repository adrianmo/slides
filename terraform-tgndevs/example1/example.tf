resource "aws_instance" "instance_1" {
  ami             = "ami-0d77397e" # Ubuntu Server 16.04 LTS
  instance_type   = "t2.micro"
}

resource "aws_ebs_volume" "volume_1" {
    availability_zone  = "${aws_instance.instance_1.availability_zone}"
    type               = "gp2"
    size               = 8
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = "${aws_ebs_volume.volume_1.id}"
  instance_id = "${aws_instance.instance_1.id}"
}

resource "aws_eip" "eip_1" {
  instance = "${aws_instance.instance_1.id}"
}
