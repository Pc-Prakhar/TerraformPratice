output "ec2_public_ip" {
  value=aws_instance.Dev.public_ip
  description="Print the value of public iop"

  sensitive = false

}

output "ec2_private_ip" {

value=aws_instance.Dev.private_ip
description = "Print the value of private ip"
  sensitive =true

}