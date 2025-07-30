aws_region  = "us-east-2"
environment = "poc"
namespace   = "arc"


########  network  ###########

vpc_name             = "vpc-arc-poc-pardhu"
azs                  = ["us-east-2a", "us-east-2b"]
main_vpc_cidr        = "10.0.0.0/16"
private_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
public_subnet_cidrs  = ["10.0.3.0/24", "10.0.4.0/24"]


########  ec2  ##########
instance_name = "pardhu-arc-training-ec2-instance"
sg_name       = "pardhu-ec2-sg"
key_pair_name = "pardhu-ec2-key-poc"

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

########  rds  ##########
db_engine         = "postgres"
db_engine_version = "16.3"
db_username       = "mydbuser"
db_instance_class = "db.t3.micro"
db_storage_size   = 20