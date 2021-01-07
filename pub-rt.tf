resource "aws_route_table" "pub-rt" {
  vpc_id = "${aws_vpc.myvpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.pub-gw.id}"
  }


  tags = {
    Name = "pub-rt"
  }
}

resource "aws_route_table_association" "subassocaiation" {
  count = "${length(data.aws_availability_zones.azs.names)}" 
  subnet_id      = "${aws_subnet.pub-sub1.*.id[count.index]}"
  route_table_id = "${aws_route_table.pub-rt.id}"
}
