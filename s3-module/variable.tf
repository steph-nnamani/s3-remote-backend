variable "env" {
  type        = string
  description = "operating environment"
  default     = "DEV"
}
variable "region" {
  type    = string
  default = "us-west-2"
}
variable "versioning_status" {
  type = string
  default = "Eabled" # You can set a default value if desired
  description = "The status of versioning for the S3 bucket."
}