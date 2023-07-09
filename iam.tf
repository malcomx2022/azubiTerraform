resource "aws_iam_user" "my_user" {
  name = "terraform-user"  
}

resource "aws_iam_policy" "my_policy" {
  name        = "mon-policy-s3"
  description = "Politique d'accès en lecture/écriture au compartiment S3"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:GetObject",
        "s3:PutObject",
        "s3:ListBucket"
      ],
      "Resource": [
        "arn:aws:s3:::my-azubi-bucket1",
        "arn:aws:s3:::my-azubi-bucket1/*"
      ]
    }
  ]
}
EOF
}

resource "aws_iam_user_policy_attachment" "my_user_policy_attachment" {
  user       = aws_iam_user.my_user.name
  policy_arn = aws_iam_policy.my_policy.arn
}
