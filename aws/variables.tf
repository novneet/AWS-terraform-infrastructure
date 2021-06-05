
variable "vpc_cidr" {
  	default	=	"10.0.0.0/16"
}
variable "subnet_cidr"{
	type=list
	default = ["10.0.1.0/24","10.0.2.0/24","10.0.3.0/24"]
}
variable "azs" {
	type=list
	default = ["ap-south-1a","ap-south-1b","ap-south-1c"]
}

variable "ec2_instance_name"{
	default = "terraform_os2"
}
variable "allowed_port"{
	type=map
	default	= {
		web_port = 80
		ssh_port = 22
	}
}
variable "ec2_username"{
	default	= "ec2-user"
}
variable "ec2_private_key"{
	default	= "mumbaikey1"
}