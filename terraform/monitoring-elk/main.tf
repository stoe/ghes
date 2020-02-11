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
  shared_credentials_file = "${var.aws_credantials_file}"
}

# ----------------------------------------------------------------------------------------------------------------------
# Build instances
# ----------------------------------------------------------------------------------------------------------------------
module "monitoring" {
  # source = "git@github.com:stoe-poc/terraform-module-ghes-monitoring.git"
  source = "/Users/stoe/automation/terraform/terraform-module-ghes-monitoring"

  vpc_id                = "${var.vpc_id}"
  name                  = "stoe-monitoring-elk"
  tags                  = "${local.tags}"
  monitoring_region     = "${var.aws_region}"
  monitoring_az         = "${var.aws_region}c"
  monitoring_assign_eip = 1
}
