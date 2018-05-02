provider "aws"
{
  access_key = "AKIAI4QWGX6SPQKDOXYQ"
    secret_key = "UX6uNn8q6J13NrIsW2DQKjugMaZRqiRnpef6zSsk"
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
