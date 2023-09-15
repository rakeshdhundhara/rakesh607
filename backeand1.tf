terraform {
  backend "s3" {
    bucket = "rakesh607"
    key    = "rak.tfstate"
    region = "ap-south-1"
    dynamodb_table = "karan01"
  }
}
