provider "aws" {
	region=var.aws_region
	access_key = var.access_key
    secret_key= var.secret_key
}
module "aws_setup_module" {
	source = "./aws"
	
}

resource "null_resource" "localexec2"{ 
	provisioner "local-exec"{
		command	= "ansible-playbook -i ${module.aws_setup_module.instance_public_ip}, --private-key './${var.ec2_private_key}.pem' httpdconf.yaml"

	}
}
