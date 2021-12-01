#Values for Networking variables
vpc                                 = "vpc-0c3045a352ead7141"
public-subnet-1-a                   = "subnet-05d88afa285e0c05c"
public-subnet-1-b                   = "subnet-0717fb415b043375f"
private-subnet-1-a                  = "subnet-046c953ac31f4f3f8"
private-subnet-1-b                  = "subnet-006e641c96967009c"

#Values for RDS variables
ecs-cluster-cpu                     = "1024"
ecs-cluster-memory                  = "2048"
assign-public-ip-service            = "false"

#Values for RDS variables
identifier_codx                     = "codex-rds"
db_name_codx                        = "codex_db"
db_username_codx                    = "codex_admin"
db_password_codx                    = "Codexadmin12345"

identifier_codx_product             = "codex-product-rds"
db_name_codx_product                = "codex_product_db"
db_username_codx_product            = "codx_product_admin"
db_password_codx_product            = "Productadmin12345"

allocated_storage                   = "50"
instance_class                      = "db.t3.micro"
parameter_group                     = "default.postgres11"
skip_final_snapshot                 = "false"
auto_minor_version_upgrade          = "true"
max_allocated_storage               = "100"
multi_az                            = "false"
port                                = "5432"
storage_type                        = "gp2"
iam_database_authentication_enabled = "false"
deletion_protection                 = "true"
copy_tags_to_snapshot               = "true"
allow_major_version_upgrade         = "false"
availability_zone                   = "us-east-2a"