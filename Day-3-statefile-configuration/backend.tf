terraform {
  backend "s3" {

    bucket="myprakharbucket"
    key = "terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "dynamodb-terraform-state-lock"
    encrypt = true
    
  }
}
  


  
