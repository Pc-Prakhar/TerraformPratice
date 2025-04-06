resource "aws_instance" "dependent" {
ami= "ami-076c6dbba59aa92e6"
instance_type = "t2.micro"
key_name ="myprakc"
  
}
resource "aws_s3_bucket" "dependent" {

    bucket = "dependentbucket"
   # depends_on = [ aws_instance.dependent ]
  
}