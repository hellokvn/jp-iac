resource "aws_key_pair" "key_pair" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
}

resource "aws_instance" "node" {
  instance_type           = var.instance_type
  ami                     = "ami-0d527b8c289b4af7f"
  key_name                = aws_key_pair.key_pair.id
  vpc_security_group_ids  = [var.public_sg]
  subnet_id               = var.public_subnets[0]
  iam_instance_profile    = var.iam_instance_profile
  disable_api_termination = true

  tags = {
    Name = "Production"
  }

  user_data = file("${path.root}/prod/ec2/userdata.tpl")

  root_block_device {
    volume_size = var.vol_size
  }
}

resource "aws_eip" "eip" {
  instance = aws_instance.node.id
}
