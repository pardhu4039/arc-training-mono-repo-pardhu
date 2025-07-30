variable "environment" {
  description = "Environment name (e.g., dev, staging, prod)"
  type        = string
}

variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
}

variable "namespace" {
  description = "Namespace for resource naming"
  type        = string
}

variable "ingress_rules" {
  description = "A list of ingress rules for the security group."
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "egress_rules" {
  description = "A list of egress rules for the security group."
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "main_vpc_cidr" {
  description = "CIDR block for the main VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
}

variable "azs" {
  description = "List of availability zones for the subnets"
  type        = list(string)
}

variable "vpc_name" {
  description = "Name for the VPC"
  type        = string
}

variable "db_username" {
  description = "The username for the database"
  type        = string
}

variable "db_engine" {
  description = "The database engine to use"
  type        = string
}

variable "db_engine_version" {
  description = "The version of the database engine"
  type        = string
}

variable "db_instance_class" {
  description = "Instance class for the RDS instance"
  type        = string
}

variable "db_storage_size" {
  description = "The size of the database storage (in GiB)"
  type        = number
}

variable "instance_name" {
  description = "Name tag for the EC2 instance"
  type        = string
}

variable "key_pair_name" {
  description = "Name for the SSH key pair"
  type        = string
}

variable "sg_name" {
  description = "Name for the security group"
  type        = string
}