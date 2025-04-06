resource "aws_instance" "name" {

    ami = var.ami_id
    instance_type = var.Instance_type
    key_name = var.key_name

    tags = {
  Name= "FirstTFec2-2"
}

}
    resource "aws_s3_bucket" "name" {
    bucket = "myprakharbucket123"
  
}



