resource "aws_subnet" "private-subnet" {
  vpc_id = aws_vpc.this.id
  cidr_block = Local.vpc.cidr_subnet_private
  map_public_ip_on_launch = false
  availability_zone = "us-east-1b"

  tags = {
    Name = "${Local.prefix}-private-subnet"
    Environment = Local.env
    Path = "${basename(abspath(path.module))}/subnet-private.tf"
}

depends_on = [
    aws_vpc.this
    ]
}