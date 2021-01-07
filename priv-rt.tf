resource "aws_route_table" "priv-rt" {
  vpc_id = "${aws_vpc.myvpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id  = "${aws_nat_gateway.gw.id}"
  }


  tags = {
    Name = "priv-rt"
  }
}

resource "aws_route_table_association" "private-subassocaiation" {
  count = "${length(data.aws_availability_zones.azs.names)}" 
  subnet_id      = "${aws_subnet.priv-sub1.*.id[count.index]}"
  route_table_id = "${aws_route_table.priv-rt.id}"
}
