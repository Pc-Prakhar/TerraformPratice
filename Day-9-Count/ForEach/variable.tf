variable "ami_id" {
  type= string
  default = ""
  description = "Passing AMI ID for Variable to main"
}

variable "Instance_type"{
  type=string
  default =""
  description="Passing Instance_type from Variable to main"

}


variable "key_name" {

    type = string
    default =""
    description = "Passing Key_name from Variable to main"
  
}

variable "users_name" {
  type=list(string)
  default = ["dev","prod"]
  
}