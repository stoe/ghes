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

# Monitoring -----------------------------------------------------------------------------------------------------------
# see modules/monitoring/variables.tf
variable "monitoring_kibana_port" {
  description = "(Optional) Kibana server port, see https://www.elastic.co/guide/en/kibana/current/settings.html"
  default     = 5601
}

variable "monitoring_logforwarding_port" {
  description = "(Optional) https://help.github.com/enterprise/admin/installation/log-forwarding"
  default     = 5455
}

variable "monitoring_collectdforwarding_port" {
  description = "(Optional) https://help.github.com/enterprise/admin/installation/configuring-collectd"
  default     = 25826
}
