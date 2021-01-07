
resource "aws_eip" "meip" {
  vpc      = true
}

resource "aws_nat_gateway" "gw" {
  allocation_id = "${aws_eip.meip.id}"
  subnet_id     = "${aws_subnet.pub-sub1.*.id[0]}"

  tags = {
    Name = "gw NAT"
  }
}
