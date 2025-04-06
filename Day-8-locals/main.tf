 locals {
 bucket-name = "${var.layer}-${var.env}-bucket-hydnard"
 
}

resource "aws_s3_bucket" "demo" {

    tags = {
    # bucket = "web-test-bucket-hydnaresh"    # bucket = "${var.layer}-${var.env}-bucket-hyd"    bucket = local.bucket-name   tags = {
        #Name = "${var.layer}-${var.env}-bucket-hyd"
        Name =local.bucket-name
        Environment = var.env
   }
   }
    