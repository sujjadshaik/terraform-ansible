resource "aws_instance" "tomcat-server-instance" {
  ami = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  availability_zone = "${var.availability_zone}"
  key_name = "${var.key_name}"
  network_interface {
    device_index = 0
    network_interface_id = "${var.interface_id}"
  
  }
  # user_data = <<-EOF
  #               #!/bin/bash
  #               sudo apt update -y
  #               sudo apt install apache2 -y
  #               sudo systemctl start apache2
  #               sudo bash -c 'echo this is my terrafrom project> /var/www/html/index.html'
  #               EOF

  # provisioner "local-exec" {
  #   command = "echo hello world >> private_ips.txt"
  # }

  # provisioner "local-exec"{
  #   command = "ansible-playbook -i ../ansible/inventory.ini ../ansible/master.yaml --private-key ~/.ssh/aws-keypair.pem"
  # }
 
  tags = {
    Name = "web-server-tomcat"
  }

}

output "public_ip" {
  value       = "${aws_instance.tomcat-server-instance.public_ip}"
  
}

