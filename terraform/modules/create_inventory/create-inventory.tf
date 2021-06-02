resource "local_file" "inventory"{
    content = "${var.public_ip}"
    filename = "../ansible/inventory.ini"
}

resource "null_resource" "execute-ansible"{
    provisioner "local-exec" {
        command = "ansible-playbook -i ../ansible/inventory.ini  ../ansible/master.yaml -u ec2-user --private-key ~/.ssh/aws-keypair.pem"
    }
}