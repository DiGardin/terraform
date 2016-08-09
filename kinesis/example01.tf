provider "aws"{
		region="${var.region}"
		profile="${var.profile}"
}


# VPC name and cidr block 

/*resource "aws_vpc" main" {
    cidr_block = "10.0.0.0/16"
tags {
        Name = "qatVpc"
        env  = "qat"
    }
}*/

resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"
    tags {
        Name = "qatVpc"
        env  = "qat"
    }
}


# Internet gateway attach to the main VPC
resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.main.id}"

      tags {
        Name = "main"
    	env = "qat"
	 }
}

# Public facing instance security group

resource "aws_subnet" "Pub-sub01" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "10.0.1.0/24"
    availability_zone= "us-west-1a"
    tags {
        Name = "Main",
        env = "qat"
    }
}



# Public facing instance security group

resource "aws_security_group" "allow_ssh" {
  name = "allow_ssh"
  description = "Allow SSH inbound traffic"

  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
      #prefix_list_ids = ["pl-12c4e678"]
  }
}

resource "aws_kinesis_stream" "test_stream" {
    name = "terraform-kinesis-test"
    shard_count = 1
    retention_period = 48
    shard_level_metrics = [
        "IncomingBytes",
        "OutgoingBytes"
    ]
    tags {
        Environment = "qat"
    }
}


resource "aws_instance" webserver {
	ami="ami-31490d51"
	instance_type="t2.micro"
	subnet_id= "${aws_subnet.Pub-sub01.id}"
	vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"]
}