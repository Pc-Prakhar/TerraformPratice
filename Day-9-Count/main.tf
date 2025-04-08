resource "aws_instance" "name" {

    ami = var.ami_id
    instance_type =var.Instance_type
    key_name = var.key_name

    //Name wise
    count=length(var.users_name)
 
    tags = {
        Name=var.users_name[count.index]
    }
}

   
  
  //print by order wise
  ###count =3
    #tags = {
  #Name= "countec2-@${count.index}



