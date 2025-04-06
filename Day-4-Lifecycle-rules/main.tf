resource "aws_instance" "test" {

    ami = var.ami_id
    instance_type = var.Instance_type
    key_name = var.key_name

    availability_zone = "ap-south-1a"
tags = {
  Name= "LifecycleTest-6"
}

     #lifecycle {
       #prevent_destroy =true  ## not be able to destroy
     #}

     lifecycle {
          create_before_destroy = true
      }

   #lifecycle { 
   #ignore_changes = [ tags, ]
   #}


}
