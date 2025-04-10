data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "takeout_assumerole" {
  statement {
    actions   = ["sts:AssumeRole"]
    resources = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
  }
}

resource "aws_iam_role" "root_takeout_bucket" {
  name               = "RootAssumeRole"
  assume_role_policy = data.aws_iam_policy_document.takeout_assumerole.json
}

data "aws_iam_policy_document" "root_takeout_policy" {
  statement {
    actions = ["s3:*"]
    effect  = "Allow"
    resources = [
      "${aws_s3_bucket.takeout.arn}/*",
      aws_s3_bucket.takeout.arn
    ]
  }
  statement {
    actions   = ["sts:AssumeRole"]
    resources = [aws_iam_role.root_takeout_bucket.arn]
    effect    = "Allow"
  }
}

resource "aws_iam_role_policy" "role_policy_attachment" {
  name   = "RootTakeoutBucketOwner"
  role   = aws_iam_role.root_takeout_bucket.id
  policy = data.aws_iam_policy_document.root_takeout_policy.json
}
