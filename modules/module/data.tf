data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = ["vpc-${var.namespace}-${var.environment}-pardhu"]
  }
  depends_on = [module.vpc]
}

data "aws_subnets" "private_subnet" {
  filter {
    name = "tag:Name"

    values = [
      "vpc-${var.namespace}-${var.environment}-pardhu-private-1",
      "vpc-${var.namespace}-${var.environment}-pardhu-private-2"
    ]
  }
  depends_on = [module.vpc]
}

data "aws_subnet" "public_subnet" {
  filter {
    name = "tag:Name"

    values = [
      "vpc-${var.namespace}-${var.environment}-pardhu-public-1",
    ]
  }
  depends_on = [module.vpc]
}