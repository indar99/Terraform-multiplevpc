resource "aws_subnet" "priv-sub1" {
  count = "${length(data.aws_availability_zones.azs.names)}"
  vpc_id     = "${aws_vpc.myvpc.id}"
  cidr_block = "${cidrsubnet(var.vpc_cidr, 2, count.index +1)}"

  tags = {
    Name = "priv-sub-${count.index}"
  }
}
