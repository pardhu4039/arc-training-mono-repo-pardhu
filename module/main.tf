terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source               = "../network"
  vpc_name             = var.vpc_name
  azs                  = var.azs
  main_vpc_cidr        = var.main_vpc_cidr
  private_subnet_cidrs = var.private_subnet_cidrs
  public_subnet_cidrs  = var.public_subnet_cidrs

}

module "ec2" {
  source        = "../ec2"
  instance_name = var.instance_name
  key_pair_name = var.key_pair_name
  vpc_id        = data.aws_vpc.vpc.id
  subnet_id     = data.aws_subnet.public_subnet.id
  namespace     = var.namespace
  sg_name       = var.sg_name
  ingress_rules = var.ingress_rules
  egress_rules  = var.egress_rules
  depends_on    = [module.vpc]
}

module "rds" {
  source            = "../db"
  aws_region        = var.aws_region
  db_engine         = var.db_engine
  environment       = var.environment
  db_engine_version = var.db_engine_version
  vpc_id            = data.aws_vpc.vpc.id
  db_username       = var.db_username
  namespace         = var.namespace
  subnet_ids        = data.aws_subnets.private_subnet.ids
  db_instance_class = var.db_instance_class
  db_storage_size   = var.db_storage_size
  depends_on        = [module.vpc]
}