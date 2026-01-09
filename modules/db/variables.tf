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

variable "db_username" {
  description = "The username for the database"
  type        = string
}

variable "ingress_rules" {
  description = "Ingress rules for the RDS security group"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = []
}

variable "egress_rules" {
  description = "Egress rules for the RDS security group"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = []
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

variable "db_storage_type" {
  description = "The storage type for the RDS instance"
  type        = string
  default     = "gp2"
}

variable "use_secrets_manager" {
  description = "Whether to use Secrets Manager for the database password"
  type        = bool
  default     = false
}

variable "backup_retention_period" {
  description = "Number of days to retain backups"
  type        = number
  default     = 7
}

variable "multi_az" {
  description = "Whether to create a Multi-AZ deployment"
  type        = bool
  default     = false
}

variable "delete_automated_backups" {
  description = "Whether to delete automated backups"
  type        = bool
  default     = true
}

variable "publicly_accessible" {
  description = "Whether the database is publicly accessible"
  type        = bool
  default     = false
}

variable "skip_final_snapshot" {
  description = "Whether to skip the final snapshot before deletion"
  type        = bool
  default     = true
}

variable "apply_immediately" {
  description = "Whether to apply changes immediately"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Additional tags to apply to the resources"
  type        = map(string)
  default     = {}
}

variable "subnet_ids" {
  description = "List of subnet IDs to be used for the VPC."
  type        = list(string)
}

variable "vpc_id" {
  description = "Name of the vpc id"
  type        = string
}