resource "aws_instance" "instance1_tf" {
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.sg_tf.id]
  subnet_id              = aws_subnet.sub1_tf.id
  user_data              = base64encode(file("userdata.sh"))
}


resource "aws_instance" "instance2_tf" {
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.sg_tf.id]
  subnet_id              = aws_subnet.sub2_tf.id
  user_data              = base64encode(file("userdata2.sh"))
}

