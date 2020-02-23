# resource "aws_launch_configuration" "app" {
#   name          = "launch-config-app"
#   image_id      = "ami-02a599eb01e3b3c5b"
#   instance_type = "t2.micro"
# # Security Group
#   key_name      = "${var.ssh_key_name}"
#   user_data = "${file("install.sh")}"
#   security_groups = ["${aws_security_group.app.id}"]
# #  load_balancers  = [aws_elb.main.id]
#   lifecycle {
#     create_before_destroy = true
#   }
# }

# resource "aws_autoscaling_group" "main" {
#   name                      = "asg-app"
#   max_size                  = "${var.asg_max}"
#   min_size                  = "${var.asg_min}"
# #  load_balancers            = ["${aws_lb.main.name}"]
#   health_check_grace_period = 300
#   health_check_type         = "ELB"
#   desired_capacity          = "${var.asg_desired}"
#   force_delete              = true
#   launch_configuration      = "${aws_launch_configuration.app.name}"
#   vpc_zone_identifier       = ["${aws_subnet.private.id}","${aws_subnet.private-1.id}"]
#   target_group_arns         = ["${aws_alb_target_group.alb_target_group.arn}"]

#   tag {
#         key = "Name"
#         value = "asg-app"
#         propagate_at_launch = true
#     }
# }

# resource "aws_autoscaling_attachment" "asg_attachment_main" {
#   autoscaling_group_name = "${aws_autoscaling_group.main.id}"
#   alb_target_group_arn   = "${aws_alb_target_group.alb_target_group.arn}"
# }

resource "aws_launch_configuration" "web" {
  name          = "launch-config-web"
  image_id      = "ami-02a599eb01e3b3c5b"
  instance_type = "t2.micro"
# Security Group
  key_name      = "${var.ssh_key_name}"
  user_data = "${file("install_web.sh")}"
  security_groups = ["${aws_security_group.web.id}"]
#  load_balancers  = [aws_elb.main.id]
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "web" {
  name                      = "asg-web"
  max_size                  = "${var.asg_web_max}"
  min_size                  = "${var.asg_web_min}"
#  load_balancers            = ["${aws_lb.main.name}"]
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = "${var.asg_web_desired}"
  force_delete              = true
  launch_configuration      = "${aws_launch_configuration.web.name}"
  vpc_zone_identifier       = ["${aws_subnet.main.id}","${aws_subnet.main-1.id}"]
  target_group_arns         = ["${aws_lb_target_group.elb-web.arn}"]

  tag {
        key = "Name"
        value = "asg-web"
        propagate_at_launch = true
    }
}

resource "aws_autoscaling_attachment" "asg_attachment_web" {
  autoscaling_group_name = "${aws_autoscaling_group.web.id}"
  alb_target_group_arn   = "${aws_lb_target_group.elb-web.arn}"
}



