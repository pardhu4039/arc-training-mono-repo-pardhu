variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "us-east-2"
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

variable "dns_support" {
  description = "Enable DNS support in the VPC"
  type        = bool
  default     = true
}

variable "dns_hostnames" {
  description = "Enable DNS hostnames in the VPC"
  type        = bool
  default     = true
}

variable "enable_nat_gw" {
  description = "Enable NAT gateway for private subnets"
  type        = bool
  default     = true
}

variable "main_vpc_tags" {
  description = "Tags for the main VPC"
  type        = map(string)
  default     = {}
}

variable "public_subnet_tags" {
  description = "Tags for public subnets"
  type        = map(string)
  default     = {}
}

variable "private_subnet_tags" {
  description = "Tags for private subnets"
  type        = map(string)
  default     = {}
}

variable "vpc_name" {
  description = "Name for the VPC"
  type        = string
}