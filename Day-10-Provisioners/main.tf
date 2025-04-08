//created keypair

resource "aws_key_pair" "prov" {
    key_name="provt"
    public_key=file("~/.ssh/id_rsa.pub")
      
}
 




resource "aws_vpc" "prov" {
  cidr_block = "10.0.0.0/16" 
  tags = {
    Name="Prov_vpc"
  }
}

resource "aws_subnet" "prov_subnet" {
      vpc_id = aws_vpc.prov.id
      cidr_block = "10.0.1.0/24"

      map_public_ip_on_launch = true
      tags = {
        Name="prov_subnet"
      }
  
}

resource "aws_route_table" "prov" {
  vpc_id = aws_vpc.prov.id

  tags = {
    Name="prov_rt"
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.prov.id

  }

}

resource "aws_internet_gateway" "prov" {
  vpc_id =aws_vpc.prov.id

  tags={
    Name="prov_ig"
  }

}

 resource "aws_route_table_association" "prov" {
        subnet_id = aws_subnet.prov_subnet.id
        route_table_id = aws_route_table.prov.id
   
 }

 resource "aws_security_group" "prov" {
    vpc_id = aws_vpc.prov.id

    tags = {
      Name="prov-sg"
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

 
 ##created Ec2

 resource "aws_instance" "prov" {
     ami = "ami-00a929b66ed6e0de6"
    instance_type = "t2.micro"
    key_name =aws_key_pair.prov.key_name
    subnet_id = aws_subnet.prov_subnet.id
    vpc_security_group_ids =[aws_security_group.prov.id]

    associate_public_ip_address = true


  tags = {
    Name="ec2-provisioner"
  }

  connection {
    
    type = "ssh"
    user = "ec2-user"
    private_key = file("~/.ssh/id_rsa")
    host= self.public_ip
  
  }
provisioner "file" {
    source = "ProvFile10"
    destination = "/home/ec2-user"
  
}

provisioner "local-exec" {
    command="touch ProvFile100"
}

provisioner "remote-exec" {
    inline = [ 
        "touch provfile99",
       "echo hello from aws >> provfile99",
     ]

}
 }

 