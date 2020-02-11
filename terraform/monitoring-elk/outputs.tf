output "monitoring" {
  description = "GHES monitoring details (ELK)"

  value = {
    "PUBLIC_IP"   = "${module.monitoring.public_ip}"
    "INSTANCE_ID" = "${module.monitoring.instance_id}"
  }
}
