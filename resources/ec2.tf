#AMI
data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-20190627.1"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"] # Canonical
}


#Super_mario
resource "aws_instance" "super_mario_instace" {
  ami           = "${data.aws_ami.ubuntu.id}"
  availability_zone = "${var.aws_az}"
  instance_type = "t2.micro"
  key_name = "${var.key_name}"
  vpc_security_group_ids = ["${aws_security_group.mario_sg.id}"]
  subnet_id = "${aws_subnet.subnet_publica.id}"
  associate_public_ip_address = true
  tags = {
      Name = "Super_mario"
  }
  user_data = "${file("../scripts/super_mario_docker.sh")}"
}