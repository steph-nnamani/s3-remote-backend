#Let us customise it with our s3 bucket example above
#Requirements
#- region is us-west-2
#- Encryption is kms
#- naming convention shoud be -
#- bootcamp32-${env}-${random.int}
#s3 naming convention allows only lowercase alphanumerical and hyphen
resource "aws_s3_bucket" "backend" {
  bucket = "bootcamp32-${lower(var.env)}-${random_integer.backend.result}"
  #lower converts all cased letters in the given string to lowercase
  tags = {
    Name        = "backend"
    Environment = "Dev"
  }
}
resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.backend.id
  versioning_configuration {
    status = var.versioning_status
  }
}



