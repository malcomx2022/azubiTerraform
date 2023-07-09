provider "aws" {
 region = "us-east-1"
}
ressource "aws_s3_bucket" "my_bucket"  {
 bucket = "my-azubi-bucket1"
}
