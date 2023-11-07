resource "aws_s3_bucket" "impex-aus-bucket" {
  bucket = var.s3_bucket_name

}

resource "aws_s3_bucket_ownership_controls" "impex-owner" {
  bucket = aws_s3_bucket.impex-aus-bucket.id
  rule {
    object_ownership = var.OwnerShip-Permission
  }
}

resource "aws_s3_bucket_acl" "access-control" {
  depends_on = [aws_s3_bucket_ownership_controls.impex-owner]

  bucket = aws_s3_bucket.impex-aus-bucket.id
  acl    = var.access_control_list
}