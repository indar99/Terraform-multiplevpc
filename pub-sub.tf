resource "aws_subnet" "pub-sub1" {
  count = "${length(data.aws_availability_zones.azs.names)}"
  vpc_id     = "${aws_vpc.myvpc.id}"
  cidr_block = "${cidrsubnet(var.vpc_cidr, 4, count.index +1)}"
  map_public_ip_on_launch = true

  tags = {
    Name = "pub-sub-${count.index}"
  }
}
