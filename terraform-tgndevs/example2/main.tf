resource "aws_security_group" "sg_1" {
  name = "allow_example"
  description = "Allow SSH, HTTP, and ICMP inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "key_pair_1" {
  key_name   = "my-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCwelPtXGNTbGQRgzWL8ay7ucQ9U4qsP6/DvGyNz3YNwFCZGr/hm6lgpneBxyxNUL4BTygqYnyFH8Dq//A6tzdrRJZUTE1unmlmoXgTGC8TWJxW57D1d6vpjSEa6BbL2AK6dFX7K8h9dsr5SQuR3IWqkbGVIwQkDX9RkrFxxv45sOB4aRYVIUrxKyB6DE0JZMgy3abmDbNIbsUMDpJJJn5XXqhGyUrnaXvckGYu1GyUuzObLrpmW0e9pB4hlgkI5lL0NJS1DSf7Vn8bJtsz67LwWpByfdK2FpP3VNlBBUtm5NgBfaaMN/64oHaNEZtCbGwYBlMnYs/pzkmsy6RrypWd adrifx@gmail.com"
}

resource "aws_instance" "instance_1" {
  ami             = "ami-0d77397e" # Ubuntu Server 16.04 LTS
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.sg_1.name}"]
  key_name        = "${aws_key_pair.key_pair_1.key_name}"

  provisioner "remote-exec" {
    connection {
      user = "ubuntu"
      private_key = "${file("~/.ssh/id_rsa")}"
    }

    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y docker.io",
      "sudo docker run -d -p 0.0.0.0:80:80 dockercloud/hello-world"
    ]
  }
}

resource "aws_ebs_volume" "volume_1" {
    availability_zone = "${aws_instance.instance_1.availability_zone}"
    type              = "gp2"
    size              = 8
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = "${aws_ebs_volume.volume_1.id}"
  instance_id = "${aws_instance.instance_1.id}"
}

resource "aws_eip" "eip_1" {
  instance = "${aws_instance.instance_1.id}"
}
