module "test" {
    source = "../Day-1"
    ami_id= var.ami
    Instance_type= var.type
    key_name= var.key

    
  
}