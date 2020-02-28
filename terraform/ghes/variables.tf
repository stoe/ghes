# AWS ------------------------------------------------------------------------------------------------------------------
variable "aws_region" {
  description = "(Required) This is the AWS region. It must be provided, but it can also be sourced from the AWS_DEFAULT_REGION environment variables, or via a shared credentials file if profile is specified"
  default     = "eu-central-1"
}

variable "aws_access_key" {
  description = "(Optional) This is the AWS access key. It must be provided, but it can also be sourced from the AWS_ACCESS_KEY_ID environment variable, or via a shared credentials file if profile is specified"
  default     = ""
}

variable "aws_secret_key" {
  description = "(Optional) This is the AWS secret key. It must be provided, but it can also be sourced from the AWS_SECRET_ACCESS_KEY environment variable, or via a shared credentials file if profile is specified"
  default     = ""
}

variable "aws_profile" {
  description = "(Optional) This is the AWS profile name as set in the shared credentials file"
  default     = ""
}

variable "aws_credentials_file" {
  description = "(Optional) This is the path to the shared credentials file. If this is not set and a profile is specified, ~/.aws/credentials will be used"
  default     = ""
}

# Stack ----------------------------------------------------------------------------------------------------------------
variable "tags" {
  description = "(Optional) A map of tags to add to all resources"
  type        = "map"

  default = {
    "Contact" = "ghes@example.com"
    "Owner"   = "Wile E. Coyote"
    "Project" = "GitHub Enterprise Server"
    "Team"    = "Acme"
  }
}

variable "vpc_id" {
  description = "The ID of the VPC to assign the resources to"
  default     = ""
}

variable "private_key_path" {
  description = "The path to the private key"
  default     = "/path/to/id_rsa"
}

variable "public_key_path" {
  description = "The path to the public key"
  default     = "/path/to/id_rsa.pub"
}

# GitHub Enterprise Server ---------------------------------------------------------------------------------------------
# see modules/ghes/variables.tf
variable "ghes_version" {
  description = "(Optional) GitHub Enterprise Server version to provision"
  default     = "2.19.3"
}

variable "ghes_instance_type" {
  description = "(Optional) GitHub Enterprise Server version to provision"
  default     = "r5.large"
}

variable "ghes_root_volume_size" {
  description = "(Optional) he size of the drive in GiBs (Minimum 200)"
  default     = 200
}

variable "ghes_data_volume_size" {
  description = "(Optional) The size of the drive in GiBs (Maximum 16000)"
  default     = 100
}

variable "ghes_data_volume_type" {
  description = "(Optional) The type of EBS volume. Can be `gp2`, `io1`"
  default     = "gp2"
}

variable "ghes_data_volume_iops" {
  description = <<EOF
(Optional) The amount of provisioned IOPs. This is only valid for `ghes_data_volume_type == "io1"`.
Value is calculated automatically. Formula `ghes_data_volume_size * 3` (Maximum 32000)
EOF

  default = 0
}

variable "ghes_logforwarding_port" {
  description = "(Optional) https://help.github.com/enterprise/admin/installation/log-forwarding"
  default     = 5455
}

variable "ghes_collectdforwarding_port" {
  description = "(Optional) https://help.github.com/enterprise/admin/installation/configuring-collectd"
  default     = 25826
}
