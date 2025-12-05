
resource "aws_instance" "app_delete_me" {
  instance_type     = "t2.micro"
  availability_zone = "us-east-2"
  ami               = "ami-0c55b159cbfafe1f0"

  user_data = <<-EOF
              #!/bin/bash
              sudo service apache2 start
              EOF
}
