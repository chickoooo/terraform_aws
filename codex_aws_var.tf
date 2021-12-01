# Variables and variable types for Network
variable "vpc" {
    type = string
}
variable "public-subnet-1-a" {
    type = string
}
variable "public-subnet-1-b" {
    type = string
}
variable "private-subnet-1-a" {
    type = string
}
variable "private-subnet-1-b" {
    type = string
}

# Variables and variable types for ECS
variable "ecs-cluster-cpu" {
    type = string
}
variable "ecs-cluster-memory" {
    type = string
}
variable "assign-public-ip-service" {
    type = bool
}

# Variables and variable types for RDS
# Codex RDS
variable "identifier_codx" {
    type = string  
}
variable "db_name_codx" {
    type = string
}
variable "db_username_codx" {
    type = string
}
variable "db_password_codx" {
    type = string
}

# Codex Product RDS
variable "identifier_codx_product" {
    type = string  
}
variable "db_name_codx_product" {
    type = string
}
variable "db_username_codx_product" {
    type = string
}
variable "db_password_codx_product" {
    type = string
}

# RDS Common Parameters
variable "allocated_storage" {
    type = number
}
variable "instance_class" {
    type = string
}
variable "parameter_group" {
    type = string
}
variable "skip_final_snapshot" {
    type = bool
}
variable "auto_minor_version_upgrade" {
    type = bool
}
variable "max_allocated_storage" {
    type = number
}
variable "multi_az" {
    type = bool
}
variable "port" {
    type = number
}
variable "storage_type" {
    type = string
}
variable "iam_database_authentication_enabled" {
    type = bool
}
variable "deletion_protection" {
    type =  bool
}
variable "copy_tags_to_snapshot" {
    type = bool
}
variable "allow_major_version_upgrade" {
    type = bool
}
variable "availability_zone" {
    type = string
}