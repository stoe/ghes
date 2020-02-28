terraform {
  required_version = ">= 0.11"
}

locals {
  tags = "${
    merge(
      map("Environment", terraform.workspace),
      var.tags
    )
  }"
}

# ----------------------------------------------------------------------------------------------------------------------
# Providers
# ----------------------------------------------------------------------------------------------------------------------
# https://www.terraform.io/docs/providers/aws/index.html
provider "aws" {
  version                 = "~> 2.33"
  region                  = "${var.aws_region}"
  profile                 = "${var.aws_profile}"
  shared_credentials_file = "${var.aws_credentials_file}"
}

# ----------------------------------------------------------------------------------------------------------------------
# Build instances
# ----------------------------------------------------------------------------------------------------------------------
module "backup_utils" {
  # source = "git@github.com:stoe-poc/terraform-module-ghes-backup-utils.git"
  source = "/Users/stoe/automation/terraform/terraform-module-ghes-backup-utils"

  vpc_id                   = "${var.vpc_id}"
  name                     = "stoe-backup-utils"
  tags                     = "${local.tags}"
  backup_utils_region      = "${var.aws_region}"
  backup_utils_az          = "${var.aws_region}c"
  backup_utils_volume_size = "${var.backup_utils_volume_size}"
}
