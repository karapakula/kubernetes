provider "aws"
{
  access_key = ""
    secret_key = ""
      region     = "us-east-1"
}

      resource "aws_instance" "example"
      {
        ami = "ami-6871a115"
	  instance_type = "t2.micro"
	    security_groups = ["default"]
	    tags {
	        Name = "TechMeet"
		  }


		  key_name = "Node1"
	}
