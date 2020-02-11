output "backup_utils" {
  description = "GHES backup-utils details"

  value = {
    "PUBLIC_IP"   = "${module.backup_utils.public_ip}"
    "INSTANCE_ID" = "${module.backup_utils.instance_id}"
  }
}
