resource "aws_eip" "ip-one" {
  vpc                       = true
  network_interface         = "${var.network_interface_id}"
  associate_with_private_ip = "${var.private_ip}"
  depends_on = [var.gateway]
}