resource "aws_security_group" "allow_webport" {
  	name        = "allow-webport"
  	description = "Allow web inbound traffic"
	vpc_id		= aws_vpc.vpc1.id

  	ingress {
    		from_port	 = var.allowed_port["ssh_port"]
    		to_port          = var.allowed_port["ssh_port"]
    		protocol         = "tcp"
    		cidr_blocks      = ["0.0.0.0/0"]
  	}

  	ingress{
		from_port	= var.allowed_port["web_port"]
		to_port		= var.allowed_port["web_port"]
		protocol	= "tcp"
		cidr_blocks	= ["0.0.0.0/0"]
  	}
  	egress {
    		from_port        = 0
    		to_port          = 0
    		protocol         = "-1"
    		cidr_blocks      = ["0.0.0.0/0"]
  	}

  	tags = {
    		Name = "allow-webport"
  	}
}