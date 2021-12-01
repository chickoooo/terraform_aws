resource "aws_ecr_repository" "carss-ecr-tf" {
  name                 = "codex-ecr"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push       = false
  }
}
