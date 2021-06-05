resource "null_resource" "remoteexec1"{
	connection{
		type	= "ssh"
		user	= "ec2-user"
		private_key	= file("./${var.ec2_private_key}.pem") 
		host=aws_instance.os2.public_ip
	}
	provisioner "remote-exec" {
		inline=[
			"sudo echo 'its done'"
		]
	}
}