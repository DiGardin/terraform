provider "aws"{
    #region="${var.region}"
    profile="${var.profile}"
}
/*
resource "aws_iam_user_policy_attachment" "attach_policy" {
    user = "${iam_user_name}"
    policy_arn = "arn:aws:iam::xxxxxxxxxx:policy/S3Readonly"
}

*/
resource "aws_iam_user_policy_attachment" "test-attach" {
    user = "${var.iam_user}"
    policy_arn = "${var.iam_policy_arn}"
}