resource "aws_instance" "dbvm" {
  count = "${var.vm_count}"
  ami           = "${var.amis[var.aws_region]}"
  instance_type = "${var.vm_type}"
  subnet_id = "${aws_subnet.priv-sub1.*.id[count.index]}"
  user_data = "${file("apache.sh")}"
  vpc_security_group_ids = ["${aws_security_group.openssh.id}"] 
  key_name = "myip"
  tags = {
    Name = "db-server"
  }
}
