variable "ami_id" {
  type= string
  default = "ami_id"
  description = "Passing AMI ID for Variable to main"
}

variable "Instance_type"{
  type=string
  default = "Instance _type"
  description="Passing Instance_type from Variable to main"


}



variable "key_name" {

    type = string
    default = "Key_name"
    description = "Passing Key_name from Variable to main"
  
}