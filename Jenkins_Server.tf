provider "aws" {
  region = "us-east-1"
}


resource "aws_security_group" "jenkins_sec_group1234" {
  name        = "jenkins_sec_group1"
  description = "this security group is for the new jenkins server"

  dynamic "ingress" {
    for_each = ["22", "9000", "80", "443", "8080", "8443"]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "Jenkins_servers" {
  ami                    = "ami-0b5de19f98fc3879b"
  instance_type          = "t3.2xlarge"
  key_name               = "Jenkins2.0"
  vpc_security_group_ids = [aws_security_group.jenkins_sec_group1234.id]
  tags = {
    Name        = "Jenkins_server1234"
    Description = "This server is for testing and learning purpouses"
    Owner       = "July Bernard"
  }



  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_security_group" "jenkins_slave_server" {
	name = "jenkins_slave"
	 description = "this is the security group for the jenkins slave server!"
##/// Try to change the ports to 0 next time you run this terraform file
	 
	 ingress {
		from_port         = 0
		to_port           = 0
		protocol          = "-1"
		cidr_blocks       = ["0.0.0.0/0"]
	  security_groups = [aws_security_group.jenkins_sec_group1234.id]
	 }


	 egress {
		from_port = 0
		to_port = 0
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	 }
	  

   depends_on = [
	aws_security_group.jenkins_sec_group1234
   ]


}

