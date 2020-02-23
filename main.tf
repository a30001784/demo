resource "aws_instance" "web" {
  ami           = "ami-02a599eb01e3b3c5b"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.web.id}"]
  key_name = "${var.ssh_key_name}"
  user_data = "${file("install_web.sh")}"
  subnet_id = "${aws_subnet.main.id}"

  tags = { 
    Name = "webserver"
  }
}

resource "aws_instance" "app" {
  ami           = "ami-02a599eb01e3b3c5b"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.app.id}"]
  key_name = "${var.ssh_key_name}"
  user_data = "${file("install_app.sh")}"
  subnet_id = "${aws_subnet.main.id}"

  tags = { 
    Name = "appserver"
  }
}

