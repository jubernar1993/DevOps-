provider "aws" {
	region = "us-east-1"
}


resource "aws_security_group" "jenkins_sec_group1" {
	name = "jenkins_sec_group1"
	description = "this security group is for the new jenkins server"

	dynamic "ingress" {
		for_each = ["22", "80", "443", "8080", "8443"]
		content {
			from_port = ingress.value
			to_port = ingress.value
			protocol = "tcp"
			cidr_blocks = ["0.0.0.0/0"]
		}
	}
 
  egress {
       from_port = 0
	   to_port = 0
	   protocol = "-1"
	   cidr_blocks = ["0.0.0.0/0"]
  }
 


}






resource "aws_instance" "Jenkins_server" {
	ami = "ami-067d1e60475437da2"
	instance_type = "t2.micro"
	key_name = "Jenkins1"
	vpc_security_group_ids = [aws_security_group.jenkins_sec_group1.id]
	user_data = file("file.sh")

	tags = {
		Name = "Jenkins_server"
		Description = "This server is for testing and learning purpouses"
		Owner = "July Bernard"
	}

	
	
	lifecycle {
		create_before_destroy = true
	}
}
