resource "aws_internet_gateway" "pub-gw" {
  vpc_id = "${aws_vpc.myvpc.id}"

  tags = {
    Name = "myvpc-igw"
  }
}
