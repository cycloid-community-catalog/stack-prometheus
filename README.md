# Stack-prometheus

Service catalog Prometheus stack

This stack will deploy a Prometheus, Alertmanager and Grafana Docker container on a Amazon EC2 instance with an EBS storage.

<img src="https://raw.githubusercontent.com/cycloid-community-catalog/stack-prometheus/master/diagram.jpeg" width="400">

> **Pipeline** The pipeline contain a manual approval between terraform plan and terraform apply.
> That means if you trigger a terraform plan, to apply it, you have to go on terraform apply job
> and click on the `+` button to trigger it.

## SSL Certificates

To have the stack working, you will also have to upload/generate SSL certificates in `"{{ playbook_dir }}/files/nginx/ssl/*"` which will be located in `"/etc/nginx/ssl/"` on the monitoring server.

To create a self-signed certificate:
```bash
openssl req -x509 -newkey rsa:4096 -keyout prometheus-secure.key -out prometheus.crt -days 3650
# if needed remove the passphrase on the key
openssl rsa -in prometheus-secure.key -out prometheus.key
rm prometheus-secure.key
```

Please use the default names for the certificate & key, or override the following variables:
```
prometheus_certificat_name: prometheus.crt
prometheus_certificat_key_name: prometheus.key
```
