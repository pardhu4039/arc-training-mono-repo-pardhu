aws_region  = "us-east-2"
environment = "poc"
namespace   = "arc"

# Security group rules
ingress_rules = [
  {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Adjust as needed for your requirements
  }
]

egress_rules = [
  {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # Allows all outbound traffic
    cidr_blocks = ["0.0.0.0/0"]
  }
]

# RDS instance configuration
db_engine                = "postgres"
db_engine_version        = "16.3"
db_instance_class        = "db.t3.micro"
db_storage_size          = 20
db_storage_type          = "gp2"
use_secrets_manager      = true
db_username              = "mydbuser"
backup_retention_period  = 7
multi_az                 = false
delete_automated_backups = true
publicly_accessible      = false
skip_final_snapshot      = true
apply_immediately        = true

# Additional tags
tags = {
  "Project" = "arc-training"
  "Owner"   = "pardhu"
}