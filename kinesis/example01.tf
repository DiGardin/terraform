provider "aws"{
		region="${var.region}"
		profile="${var.profile}"
}


resource "aws_kinesis_stream" "stream" {
    name = "terraform-kinesis"
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

output "stream-id"{
  value = "${aws_kinesis_stream.stream.id}"
}

