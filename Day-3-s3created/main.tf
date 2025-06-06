resource "aws_s3_bucket" "name" {
  bucket = "myprakharbucket"
  
}


resource "aws_dynamodb_table" "dynamodb-terraform-state-lock"{
  name="dynamodb-terraform-state-lock"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20
 
  attribute {
    name = "LockID"
    type = "S"

  }

}