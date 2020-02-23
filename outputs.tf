# output "alb_dns_name" {
#    value = "${aws_alb.main.dns_name}"
#  }

output "elb_dns_name" {
   value = "${aws_instance.web.public_dns}"
 }


# output "private_ip_app" {
#   value = "${aws_instance.main.private_ip}"
# }