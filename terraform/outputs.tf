#output "front_private_ips" {
#  value = "${module.prometheus.front_private_ips}"
#}


output "rds_address" {
  value = "${module.prometheus.rds_address}"
}
output "rds_port" {
  value = "${module.prometheus.rds_port}"
}
output "rds_username" {
  value = "${module.prometheus.rds_username}"
}
output "rds_password" {
  value = "${var.rds_password}"
}
output "rds_database" {
  value = "${module.prometheus.rds_database}"
}
output "rds_engine" {
  value = "${module.prometheus.rds_engine}"
}
output "prometheus_eip" {
    value = "${module.prometheus.prometheus_eip}"
}
