# Create a new instance on AWS and Tag it

provider "aws" {
    region = "us-east-1"
    profile="${var.profile}"
}

resource "aws_instance" "new_instance" {
    ami 					= "${var.ami}"
    key_name				= "${var.keypair}"
    instance_type			= "${var.instance_type}"
    vpc_security_group_ids  = "${var.security_group}"
    subnet_id				= "${var.subnet_id}"
    ebs_optimized   = true
    root_block_device {
        volume_type = "${var.root_volume_type}"
        volume_size = "${var.root_volume_size}"
        }
    associate_public_ip_address= false
    tags {
        Name 				= "${var.server_name}"
        Environment			= "${var.env}"
    }
}

resource "aws_eip" "new_epi" {
  vpc 						= true
  instance                  = "${aws_instance.new_instance.id}"
  #associate_with_private_ip = "10.0.0.12"
}

/*
resource "aws_eip_association" "eip_assoc" {
  instance_id = "${aws_instance.new_instance.id}"
  allocation_id = "${eip_id}"
}
*/

output "address" {
 value = "${aws_instance.new_instance.public_dns}"
}