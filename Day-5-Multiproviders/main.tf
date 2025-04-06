resource "aws_s3_bucket" "test" {
    bucket = "multiprovidebucket"
    provider = aws.America ## choose the region where you to created bucket
  
}
resource "aws_s3_bucket" "test1" {
    bucket="multi12bucket"
    provider = aws.India
  
}