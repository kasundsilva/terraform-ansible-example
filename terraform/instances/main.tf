resource "aws_eip" "nginx_eip" {
  depends_on = ["aws_instance.nginx_instance"]
  vpc = true
}

resource "aws_instance" "nginx_instance" {

  ami = "${var.ubuntu_ami}"
  vpc_security_group_ids = ["${var.security_group_ids}"]
  subnet_id = "${element(split(",", var.public_subnets_ids), count.index%2)}"
  instance_type = "${var.nginx_instance_type}"
  key_name = "${var.aws_key_name}"
  #user_data =  "${file("${var.bootstrap_path}")}"
  #Configure the instance with ansible-playbook
  #provisioner "local-exec" {
  #  command = "sleep 120; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u ubuntu --private-key '${var.aws_key_path}' -i '${self.public_ip}' nginx-provisioner.yaml"
  #}

  tags {
    Name = "${var.name}_nginx-instance"
  }
}