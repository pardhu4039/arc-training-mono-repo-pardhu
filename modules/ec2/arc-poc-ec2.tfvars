aws_region                  = "us-east-2"
environment                 = "poc"
namespace                   = "arc"
instance_name               = "pardhu-arc-training-ec2-instance"
associate_public_ip_address = true
instance_type               = "t2.micro"
sg_name                     = "pardhu-ec2-sg"
key_pair_name               = "pardhu-ec2-key-poc"
root_volume_size            = 10
root_volume_type            = "gp2"
encrypted                   = true
common_tags = {
  Environment = "poc"
  Project     = "arc-training"
}

ingress_rules = [{
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  },
  {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

]

egress_rules = [
  {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
]