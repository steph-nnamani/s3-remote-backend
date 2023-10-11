output "s3bucket-name" {
  value = aws_s3_bucket.backend.bucket
}

output "s3bucket-id" {
  value = "aws_s3_bucket.backend.id"
}