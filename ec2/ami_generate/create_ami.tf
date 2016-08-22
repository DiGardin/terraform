provider "aws" {
    region = "us-east-1"
    profile="${var.profile}"
}
resource "aws_ami_from_instance" "new_ami" {
    name = "${var.ami_name}"
    source_instance_id = "${var.instance_id}"
    snapshot_without_reboot = true
}
