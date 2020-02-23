variable "user_name" { default = "ubuntu" }
variable "ssh_key_path" { 
  default = "../postgre.pem" 
  }

variable "ssh_key_name" { 
  default = "postgre" 
  }
  
variable "cidr" { 
  default  ="10.2.0.0/16"
}

variable "source_cidr_block" { 
  default  = "10.2.2.0/24"
}

variable "source_cidr_block1" { 
  default  = "10.2.3.0/24"
}

variable "private_cidr_block" {
  default = "10.2.4.0/24"
}

variable "private_cidr_block1" {
  default = "10.2.5.0/24"
}

variable "region" { 
   default = "ap-southeast-2" 
}

 variable "private_key_path" {
   default     = "postgre.pem"
 }

#   variable "asg_max" {
#    default     = "1"
#  }

#    variable "asg_min" {
#    default     = "1"
#  }

#    variable "asg_desired" {
#    default     = "1"
#  }

   variable "asg_web_max" {
   default     = "2"
 }

   variable "asg_web_min" {
   default     = "2"
 }

   variable "asg_web_desired" {
   default     = "2"
 }

  variable "access_key" {
   default = "AKIAJKFENDIH6WZI6UJA"
 }

  variable "secret_access_key" {
   default = "4myJ7CqbW9BkGUxQsLbCDkDaJWDGtAtsyqoePFVu"
 }

