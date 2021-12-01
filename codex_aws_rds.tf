resource "aws_db_instance" "codx-rds" {
  identifier                            = var.identifier_codx
  allocated_storage                     = var.allocated_storage
  engine                                = "postgres"
  engine_version                        = 11.10
  instance_class                        = var.instance_class
  name                                  = var.db_name_codx
  username                              = var.db_username_codx
  password                              = var.db_password_codx
  parameter_group_name                  = var.parameter_group
  skip_final_snapshot                   = var.skip_final_snapshot
  auto_minor_version_upgrade            = var.auto_minor_version_upgrade
  max_allocated_storage                 = var.max_allocated_storage
  multi_az                              = var.multi_az
  port                                  = var.port
  storage_type                          = var.storage_type
  db_subnet_group_name                  = aws_db_subnet_group.codx-rds-subnet-group.name
  vpc_security_group_ids                = ["${aws_security_group.codx-rds-sg.id}"]
  iam_database_authentication_enabled   = var.iam_database_authentication_enabled
  deletion_protection                   = var.deletion_protection
  copy_tags_to_snapshot                 = var.copy_tags_to_snapshot
  allow_major_version_upgrade           = var.allow_major_version_upgrade
  availability_zone                     = var.availability_zone
}

resource "aws_db_instance" "codx-product-rds" {
  identifier                            = var.identifier_codx_product
  allocated_storage                     = var.allocated_storage
  engine                                = "postgres"
  engine_version                        = 11.10
  instance_class                        = var.instance_class
  name                                  = var.db_name_codx_product
  username                              = var.db_username_codx_product
  password                              = var.db_password_codx_product
  parameter_group_name                  = var.parameter_group
  skip_final_snapshot                   = var.skip_final_snapshot
  auto_minor_version_upgrade            = var.auto_minor_version_upgrade
  max_allocated_storage                 = var.max_allocated_storage
  multi_az                              = var.multi_az
  port                                  = var.port
  storage_type                          = var.storage_type
  db_subnet_group_name                  = aws_db_subnet_group.codx-rds-subnet-group.name
  vpc_security_group_ids                = ["${aws_security_group.codx-rds-sg.id}"]
  iam_database_authentication_enabled   = var.iam_database_authentication_enabled
  deletion_protection                   = var.deletion_protection
  copy_tags_to_snapshot                 = var.copy_tags_to_snapshot
  allow_major_version_upgrade           = var.allow_major_version_upgrade
  availability_zone                     = var.availability_zone
}