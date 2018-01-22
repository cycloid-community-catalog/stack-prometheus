# Stack-prometheus

Service catalog Prometheus stack

This stack will deploy a Prometheus, Alertmanager and Grafana Docker container on a Amazon EC2 instance with an EBS storage.

<img src="https://raw.githubusercontent.com/cycloid-community-catalog/stack-prometheus/master/diagram.jpeg" width="400">

> **Pipeline** The pipeline contain a manual approval between terraform plan and terraform apply.
> That means if you trigger a terraform plan, to apply it, you have to go on terraform apply job
> and click on the `+` button to trigger it.

