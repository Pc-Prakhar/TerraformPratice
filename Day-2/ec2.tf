resource "aws_instance" "Dev"{
    ami = var.ami_id
    instance_type =var.instance_type
    key_name = var.key_name
    vpc_security_group_ids = [aws_security_group.Dev.id]
    subnet_id = aws_subnet.Dev.id
    associate_public_ip_address =true
   

    tags = {
      Name="Prakc_dev-ec2"
    }
  
}