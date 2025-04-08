resource "aws_instance" "ec2" {

    ami = "ami-002f6e91abff6eb96"
    instance_type = "t2.micro"
    key_name = "myprakc"
     tags = {
        Name="ec2-userdata"
     }
    user_data = file("script.sh")
    
      
}