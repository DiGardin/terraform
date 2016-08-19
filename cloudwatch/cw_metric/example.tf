provider "aws"{
		region="${var.region}"
		profile="${var.profile}"
}


/*resource "aws_cloudwatch_log_group" "log_terraform" {
  name = "terraform_log"
}

resource "aws_cloudwatch_log_metric_filter" "metric_terraform" {
  name = "terraform_metric"
  pattern = ""
  log_group_name = "${aws_cloudwatch_log_group.log_terraform}"

  metric_transformation {
    name = "EventCount"
    namespace = "terraform_Namespace"
    value = "1"
  }
}*/

resource "aws_cloudwatch_metric_alarm" "terraform_metric" {
    alarm_name = "metric_terraform"
    comparison_operator = "LessThanOrEqualToThreshold"
    evaluation_periods = "2"
    metric_name = "CPUUtilization"
    namespace = "AWS/EC2"
    period = "120"
    statistic = "Average"
    threshold = "20"
    #unit = "%"
    alarm_description = "This metric monitor ec2 cpu utilization"
    insufficient_data_actions = []
}

