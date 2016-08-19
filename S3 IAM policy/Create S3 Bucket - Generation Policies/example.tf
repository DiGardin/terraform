provider "aws"{
    #region="${var.region}"
    profile="${var.profile}"
}

resource "aws_s3_bucket" "createbucket" {
    bucket = "${var.bucket_name}"
    #oacl = "private"

}


resource "aws_iam_policy" "policy_read" {
    name = "s3_read_write_${var.bucket_name}"
    path = "/"
    description = "S3 Read access for ${var.bucket_name}"
    policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:ListBucket"
            ],
            "Resource": [
                "arn:aws:s3:::${var.bucket_name}"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:GetObject"
            ],
            "Resource": [
                "arn:aws:s3:::${var.bucket_name}/*"
            ]
        }
    ]
}
EOF
}


resource "aws_iam_policy" "policy_read_write" {
    name = "s3-read_${var.bucket_name}"
    path = "/"
    description = "S3 Read write for ${var.bucket_name}"
    policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:ListBucket"
            ],
            "Resource": [
                "arn:aws:s3:::${var.bucket_name}"
                ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:PutObject",
                "s3:GetObject"
            ],
            "Resource": [
                "arn:aws:s3:::${var.bucket_name}/*"
            ]
        }
    ]
}
EOF
}