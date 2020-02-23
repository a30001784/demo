# Create an application load balancer
# resource "aws_alb" "main" {
#   name               = "alb-app"
#   internal           = false
#   load_balancer_type = "application"
#   security_groups    = ["${aws_security_group.alb.id}"]
#   subnets            = ["${aws_subnet.private.id}","${aws_subnet.private-1.id}"]

#   tags = {    
#     Name    = "alb-app"
#   }   
# }

# resource "aws_alb_target_group" "alb_target_group" {  
#   name     = "alb-app-tg"  
#   port     = "3000"  
#   protocol = "HTTP"  
#   vpc_id   = "${aws_vpc.default.id}"   
#   tags = {    
#     name = "alb-app-tg"   
#   }   

#   health_check {    
#     healthy_threshold   = 3    
#     unhealthy_threshold = 10    
#     timeout             = 5    
#     interval            = 10    
#  #   path                = "${var.target_group_path}"    
#     port                = "3000"  
#   }
# }
# resource "aws_alb_listener" "alb_listener" {  
#   load_balancer_arn = "${aws_alb.main.arn}"  
#   port              = "80"  
#   protocol          = "HTTP"
  
#   default_action {    
#     target_group_arn = "${aws_alb_target_group.alb_target_group.arn}"
#     type             = "forward"  
#   }
# }

# resource "aws_alb_listener_rule" "listener_rule" {
#   depends_on   = ["aws_alb_target_group.alb_target_group"]  
#   listener_arn = "${aws_alb_listener.alb_listener.arn}"  
#   priority     = "100"   
#   action {    
#     type             = "forward"    
#     target_group_arn = "${aws_alb_target_group.alb_target_group.id}"  
#   }   
#    condition {    
#      #field  = "path-pattern"    
#      #values = ["/*"]
#      path_pattern {
#         values = ["/*"]
#       }  
#    }
# }

# Create a Web load balancer
resource "aws_lb" "web" {
  name               = "elb-web"
  internal           = false
  security_groups    = ["${aws_security_group.elb.id}"]
  subnets            = ["${aws_subnet.main.id}","${aws_subnet.main-1.id}"]

  tags = {    
    Name    = "elb-web"
  }   
}

resource "aws_lb_target_group" "elb-web" {  
  name     = "elb-web-tg"  
  port     = "80"  
  protocol = "HTTP"  
  vpc_id   = "${aws_vpc.default.id}"   
  tags = {    
    name = "elb-web-tg"   
  }   

  health_check {    
    healthy_threshold   = 3    
    unhealthy_threshold = 10    
    timeout             = 5    
    interval            = 10    
 #   path                = "${var.target_group_path}"    
    port                = "3000"  
  }
}
resource "aws_lb_listener" "web" {  
  load_balancer_arn = "${aws_lb.web.arn}"  
  port              = "80"  
  protocol          = "HTTP"
  
  default_action {    
    target_group_arn = "${aws_lb_target_group.elb-web.arn}"
    type             = "forward"  
  }
}

resource "aws_lb_listener_rule" "web" {
  depends_on   = ["aws_lb_target_group.elb-web"]  
  listener_arn = "${aws_lb_listener.web.arn}"  
  priority     = "100"   
  action {    
    type             = "forward"    
    target_group_arn = "${aws_lb_target_group.elb-web.arn}"  
  }   
   condition {    
     #field  = "path-pattern"    
     #values = ["/*"]
     path_pattern {
        values = ["/*"]
      }  
   }
}

