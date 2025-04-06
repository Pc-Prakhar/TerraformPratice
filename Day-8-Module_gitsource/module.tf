module "git" {

    source = "github.com/Pc-Prakhar/TerraformPratice/Day-1"

        ami_id = "ami-076c6dbba59aa92e6"
         Instance_type="t2.micro"
        key_name  ="myprakc"
}