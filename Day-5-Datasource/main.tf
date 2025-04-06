

data "aws_ami" "awslinux" {
  most_recent = true
  owners = [ "amazon" ]
  filter {
    name = "name"
    values = [ "amazon-eks-node-1.24-v20231201" ]
  }
  filter {
    name = "root-device-type"
    values = [ "ebs" ]
  }
  filter {
    name = "virtualization-type"
    values = [ "hvm" ]
  }
  filter {
    name = "architecture"
    values = [ "x86_64" ]
  }
}

data "aws_subnet" "datasource"{
    filter {
    name   = "tag:Name"
    values = ["datasourcesubnet"] ##give subnet name ..not an id
 
    }
}

resource "aws_instance" "datasource" {
    ami=data.aws_ami.awslinux.id
    subnet_id =data.aws_subnet.datasource.id
    instance_type = "t2.micro"
    key_name ="myprakc"
 
    tags = {
      Name="DatasouceEc2"
    }
   


  
}
