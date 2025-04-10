resource "aws_s3_bucket" "takeout" {
  bucket = "amolicobcloud-googletakeout" # Replace with a globally unique bucket name
}

data "aws_iam_policy_document" "takeout_bucket_policy" {
  statement {
    actions = ["s3:*"]
    resources = [
      "${aws_s3_bucket.takeout.arn}/*",
      aws_s3_bucket.takeout.arn
    ]
    principals {
      type        = "AWS"
      identifiers = [aws_iam_role.root_takeout_bucket.arn]
    }
  }
}

resource "aws_s3_bucket_policy" "takeout" {
  bucket = aws_s3_bucket.takeout.bucket
  policy = data.aws_iam_policy_document.takeout_bucket_policy.json
}
