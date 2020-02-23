# resource "aws_instance" "main" {
#   ami           = "ami-02a599eb01e3b3c5b"
#   instance_type = "t2.micro"
#   vpc_security_group_ids = ["${aws_security_group.app.id}"]
#   key_name = "${var.ssh_key_name}"
#   user_data = "${file("install.sh")}"
#   subnet_id = "${aws_subnet.main.id}"

  # provisioner "remote-exec" {
  #   inline = [
  #     "sudo apt-get -y update", 
  #     "sudo apt install -y software-properties-common",
  #     "sudo add-apt-repository -y ppa:deadsnakes/ppa",
  #     "sudo apt install -y python3.7",
  #     "python3.7 --version"
  #   ]
  #   connection {
  #     type = "ssh"
  #     user = "ubuntu"
  #     host = "${self.public_ip}"
  #     private_key = "${file("${var.ssh_key_path}")}"  
  #   }
  # }

#   tags = { 
#     Name = "application"
#   }
# }

# resource "aws_instance" "web" {
#   ami           = "ami-02a599eb01e3b3c5b"
#   instance_type = "t2.micro"
#   vpc_security_group_ids = ["${aws_security_group.web.id}"]
#   key_name = "${var.ssh_key_name}"
#   user_data = "${file("install_web.sh")}"
#   subnet_id = "${aws_subnet.main.id}"
  
#   # provisioner "remote-exec" {
#   #   inline = [
#   #     "sudo apt-get -y update",
#   #     "sudo apt-get -y install nginx",
#   #     "sudo service nginx start",
#   #   ]
#   #   connection {
#   #     type = "ssh"
#   #     user = "ubuntu"
#   #     host = "${self.public_ip}"
#   #     private_key = "${file("${var.ssh_key_path}")}"  
#   #   }
  # }

#   tags = { 
#     Name = "webserver"
#   }
# }

