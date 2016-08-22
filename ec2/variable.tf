
variable "profile" {
    description = "AWS credentials profile you want to use"
    default= "prod-cfn"
}

variable "ami" {
    default= "ami-f0680fe7"
}

variable "instance_type" {
    default= "m4.4xlarge"
    #default= "t2.micro"
}

variable "keypair" {
    default= "prodCMX"
}

variable "subnet_id" {
    default= "subnet-1933c441"
}

variable "server_name" {
    default= "prodTableau10"
}

variable "env" {
    default= "prod"
}

variable "security_group" {
    default= ["sg-71458715", "sg-a612ccdf"]
}

variable "root_volume_size" {
    default= "128"
}

variable "root_volume_type" {
    default= "gp2"
}

/*variable "eip_id" {
    default= "eipalloc-64566602"    
}
*/
