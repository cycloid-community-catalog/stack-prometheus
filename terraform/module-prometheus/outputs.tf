#ELB

#output "elb_prometheus_dns_name" {
#  value = "${aws_elb.prometheus.dns_name}"
#}
#
#output "elb_prometheus_zone_id" {
#  value = "${aws_elb.prometheus.zone_id}"
#}
#
#output "prometheus_private_ips" {
#    value = "${join(",", aws_instance.prometheus.*.private_ip)}"
#}

output "prometheus_eip" {
  value = "${aws_eip.prometheus.public_ip}"
}

output "prometheus_secgroup_id" {
  value = "${aws_security_group.prometheus.id}"
}

# workaround to handle count = 0 on output
# https://github.com/hashicorp/terraform/issues/16726
output "rds_address" {
  value = "${element(concat(aws_db_instance.grafana.*.address, list("")), 0)}"
}

output "rds_port" {
  value = "${element(concat(aws_db_instance.grafana.*.port, list("")), 0)}"
}

output "rds_database" {
  value = "${element(concat(aws_db_instance.grafana.*.name, list("")), 0)}"
}

output "rds_username" {
  value = "${element(concat(aws_db_instance.grafana.*.username, list("")), 0)}"
}

output "rds_engine" {
  value = "${element(concat(aws_db_instance.grafana.*.engine, list("")), 0)}"
}
