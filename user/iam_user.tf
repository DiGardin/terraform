
provider "aws"{
    #region="${var.region}"
    profile="${var.profile}"
}

resource "aws_iam_user" "user" {
    name = "${var.user_name}"
    path = "/"
}

resource "aws_iam_access_key" "user-key" {
    user = "${aws_iam_user.user.name}"
    depends_on = ["aws_iam_user.user"]
}

/*
resource "aws_iam_user_policy" "ec2-read" {
    name = "ec2-read"
    user = "${aws_iam_user.user.name}"
    depends_on = ["aws_iam_user.user"]
    policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}
*/

output "access-key" {
    value = "${aws_iam_access_key.user-key.id}"
}
output "secret-key" {
     value = "${aws_iam_access_key.user-key.secret}"
}