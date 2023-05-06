resource "aws-eip" "nat" {
    vpc = true

    tags = {
        Name = "${Local.prefix}-nat-eip"
        Environment = Local.env
        Path = "${basename(abspath(path.module))}/ng.tf"
    }
}

resource "aws_nat_gateway" "nat" {
    subnet_id = "${aws_subnet.public-subnet.id}"
    allocation_id =aws_eip.nat.id

    tags = {
      Name = "${Local.prefix}-nat-gataway"
      Environment = Local.env
      Path = "${basename(abspath(path.module))}/ng.tf"
    }

    depends_on = [ aws_internet_gateway.this ]
}