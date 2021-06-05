resource "aws_vpc" "vpc1" {
	cidr_block = var.vpc_cidr
	tags={
		"Name"	=	"tf-vpc"
	}
	lifecycle {
	  prevent_destroy=false
	}
	enable_dns_hostnames=true
}
resource "aws_internet_gateway" "ig1" {
	vpc_id = aws_vpc.vpc1.id
	tags = {
		"Name"	=	"tf_ig"
	}
}
resource "aws_subnet" "subnet" {
	count=length(var.subnet_cidr)
	vpc_id = aws_vpc.vpc1.id
	cidr_block = element(var.subnet_cidr , count.index)
	availability_zone = element(var.azs , count.index)
	map_public_ip_on_launch = true
	tags = {
	  "Name" = "tf-subnet"
	}

}
resource "aws_route_table" "rt" {
	vpc_id = aws_vpc.vpc1.id
	route{
		cidr_block	=	"0.0.0.0/0"
		gateway_id	=	aws_internet_gateway.ig1.id
	}
	tags = {
	  "Name" = "myRT"
	}
}
resource "aws_route_table_association" "RTAssociation" {
	count=length(var.azs)
	route_table_id = aws_route_table.rt.id
	subnet_id = element(aws_subnet.subnet.*.id , count.index)
}