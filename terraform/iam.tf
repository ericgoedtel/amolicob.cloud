data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "takeout_assumerole" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type = "AWS"
      identifiers = [
        "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
      ]
    }
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

resource "aws_iam_openid_connect_provider" "tfc" {
  url = "https://app.terraform.io"
  client_id_list = [
    "aws.workload.identity",
  ]
}

resource "aws_iam_user" "amolicob_user" {
  name = "amolicob_user"
  path = "/"
}

data "aws_iam_policy_document" "amolicob_role_assume_role_policy" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "AWS"
      identifiers = [aws_iam_user.amolicob_user.arn]
    }
  }
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRoleWithWebIdentity"]
    principals {
      type        = "Federated"
      identifiers = [aws_iam_openid_connect_provider.tfc.arn]
    }
    condition {
      test     = "StringEquals"
      variable = "app.terraform.io:aud"
      values   = ["aws.workload.identity"]
    }
    condition {
      test     = "StringLike"
      variable = "app.terraform.io:sub"
      values   = ["organization:${var.tfc_organization}:project:${var.tfc_project_name}:workspace:*:run_phase:*"]
    }
  }
}

resource "aws_iam_role" "amolicob_role" {
  name = "amolicob_role"
  path = "/"

  assume_role_policy = data.aws_iam_policy_document.amolicob_role_assume_role_policy.json
}

resource "aws_iam_user_policy" "amolicob_user_assume_role_policy" {
  name = "amolicob_user_assume_role_policy"
  user = aws_iam_user.amolicob_user.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "sts:AssumeRole"
        Resource = aws_iam_role.amolicob_role.arn
      },
    ]
  })
}
