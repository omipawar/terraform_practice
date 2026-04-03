resource "aws_s3_bucket" "backendBucket" {
  bucket = "omipawar-tf-state-bucket"

  tags = {
    Name = "omipawar-tf-state-bucket"
  }
}
