provider "aws"{
		region="${var.region}"
		profile="${var.profile}"
}


resource "aws_cloudwatch_log_group" "log-grp" {
  name = "test-log"
}