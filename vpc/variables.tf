variable "region" {
	default= "us-west-1"
}

variable "profile" {
	description = "AWS credentials profile you want ti use"
}

variable "key_name" {
	description = "Name of the AWS key pair"
}

variable "public_key_path" {
	description=<<Description
	Path to the SSH public key for authentication
	Example ~/.ssh/terraform-test.pub
	Description

}