resource "aws_instance" "name" {

    ami = var.ami_id
    instance_type =var.Instance_type
    key_name = var.key_name

    tags = {
  Name= "countec2"

}
count =5

}