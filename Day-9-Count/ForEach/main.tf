resource "aws_instance" "name" {

    ami = var.ami_id
    instance_type =var.Instance_type
    key_name = var.key_name
    for_each =toset(var.users_name)

    tags = {
      Name= each.value
    }
    }

   
    
