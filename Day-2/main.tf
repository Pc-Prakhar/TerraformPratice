##Created VPC and attach to IG
resource "aws_vpc" "Dev" {

    cidr_block = "10.0.0.0/16"

    tags = {
    Name ="Cust_VPC"
    }

  
}


## Create Internet gateway and attach to VPCcheck "

resource "aws_internet_gateway"  "Dev"{
 
 vpc_id = aws_vpc.Dev.id

 tags = {
   Name="Cust_IG"
 }
  
}


##Create public subnet and attach to VPC

resource "aws_subnet" "Dev" {

    vpc_id = aws_vpc.Dev.id
    cidr_block = "10.0.0.0/24"
    map_public_ip_on_launch =true
  tags ={
    Name="cust_pub_subnet"
  }
  
}


##Create Route table and attach to VPC

resource "aws_route_table" "Dev" {
vpc_id = aws_vpc.Dev.id
tags = {
  Name="cust_RT"
}

route{
    cidr_block="0.0.0.0/0"
gateway_id = aws_internet_gateway.Dev.id

}


   
}


resource "aws_route_table_association" "name" {

       subnet_id = aws_subnet.Dev.id

        route_table_id =aws_route_table.Dev.id
  
}


## Create sececurity group

resource "aws_security_group" "Dev"{
vpc_id = aws_vpc.Dev.id

tags ={

    Name= "Cust_Dev_SG"
}
ingress {
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = "80"
    to_port     = "80"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}