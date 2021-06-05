resource "aws_instance" "os2" {
	ami = "ami-010aff33ed5991201"
	subnet_id = aws_subnet.subnet[0].id
  	instance_type = "t2.micro"
  	vpc_security_group_ids = [aws_security_group.allow_webport.id]
	associate_public_ip_address = true
  	key_name = var.ec2_private_key
  	tags = {
    	"Name" = var.ec2_instance_name
  	}
}
output "instance_public_ip" {
	value = aws_instance.os2.public_ip
  
}