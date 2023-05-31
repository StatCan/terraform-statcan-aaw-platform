## terraform-statcan-aaw-platform

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 2.0.0, < 3.0.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 2.0.0, < 3.0.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.0.0, < 3.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | >= 2.0.0, < 3.0.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_app_platform"></a> [app\_platform](#module\_app\_platform) | git::https://gitlab.k8s.cloud.statcan.ca/cloudnative/terraform/modules/terraform-statcan-kubernetes-app-platform.git | v4.3.0 |
| <a name="module_core_platform"></a> [core\_platform](#module\_core\_platform) | git::https://gitlab.k8s.cloud.statcan.ca/cloudnative/terraform/modules/terraform-statcan-kubernetes-core-platform.git | v2.18.0 |
| <a name="module_namespace_daaas_system"></a> [namespace\_daaas\_system](#module\_namespace\_daaas\_system) | git::https://github.com/canada-ca-terraform-modules/terraform-kubernetes-namespace.git | v2.2.0 |
| <a name="module_platform_infrastructure"></a> [platform\_infrastructure](#module\_platform\_infrastructure) | git::https://gitlab.k8s.cloud.statcan.ca/cloudnative/terraform/modules/terraform-azure-statcan-cloud-native-platform-infrastructure.git | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_administrative_groups"></a> [administrative\_groups](#input\_administrative\_groups) | List of administrative groups | `list(string)` | n/a | yes |
| <a name="input_aks_system_subnet_id"></a> [aks\_system\_subnet\_id](#input\_aks\_system\_subnet\_id) | AKS System subnet ID | `any` | n/a | yes |
| <a name="input_argo_workflows_client_id"></a> [argo\_workflows\_client\_id](#input\_argo\_workflows\_client\_id) | The Client ID for Argo Workflows | `any` | n/a | yes |
| <a name="input_argo_workflows_client_secret"></a> [argo\_workflows\_client\_secret](#input\_argo\_workflows\_client\_secret) | The Client Secret for Argo Workflows | `any` | n/a | yes |
| <a name="input_azure_region"></a> [azure\_region](#input\_azure\_region) | Region to deploy Azure resources in | `any` | n/a | yes |
| <a name="input_azure_tags"></a> [azure\_tags](#input\_azure\_tags) | Tags to apply to Azure resources | `map(string)` | n/a | yes |
| <a name="input_cluster_node_resource_group_name"></a> [cluster\_node\_resource\_group\_name](#input\_cluster\_node\_resource\_group\_name) | Name of resource group containing the AKS cluster nodes | `any` | n/a | yes |
| <a name="input_cluster_resource_group_name"></a> [cluster\_resource\_group\_name](#input\_cluster\_resource\_group\_name) | Name of resource group containing the AKS cluster | `any` | n/a | yes |
| <a name="input_dns_zone_id"></a> [dns\_zone\_id](#input\_dns\_zone\_id) | Azure DNS Zone ID | `any` | n/a | yes |
| <a name="input_dns_zone_name"></a> [dns\_zone\_name](#input\_dns\_zone\_name) | Name of the dns zone | `any` | n/a | yes |
| <a name="input_dns_zone_resource_group_name"></a> [dns\_zone\_resource\_group\_name](#input\_dns\_zone\_resource\_group\_name) | Azure DNS Zone ID | `any` | n/a | yes |
| <a name="input_dns_zone_subscription_id"></a> [dns\_zone\_subscription\_id](#input\_dns\_zone\_subscription\_id) | Azure DNS Zone ID | `any` | n/a | yes |
| <a name="input_gk_audit_limits_cpu"></a> [gk\_audit\_limits\_cpu](#input\_gk\_audit\_limits\_cpu) | n/a | `any` | n/a | yes |
| <a name="input_gk_audit_limits_memory"></a> [gk\_audit\_limits\_memory](#input\_gk\_audit\_limits\_memory) | n/a | `any` | n/a | yes |
| <a name="input_gk_audit_requests_cpu"></a> [gk\_audit\_requests\_cpu](#input\_gk\_audit\_requests\_cpu) | n/a | `any` | n/a | yes |
| <a name="input_gk_audit_requests_memory"></a> [gk\_audit\_requests\_memory](#input\_gk\_audit\_requests\_memory) | n/a | `any` | n/a | yes |
| <a name="input_gk_limits_cpu"></a> [gk\_limits\_cpu](#input\_gk\_limits\_cpu) | n/a | `any` | n/a | yes |
| <a name="input_gk_limits_memory"></a> [gk\_limits\_memory](#input\_gk\_limits\_memory) | n/a | `any` | n/a | yes |
| <a name="input_gk_replicas"></a> [gk\_replicas](#input\_gk\_replicas) | n/a | `any` | n/a | yes |
| <a name="input_gk_requests_cpu"></a> [gk\_requests\_cpu](#input\_gk\_requests\_cpu) | n/a | `any` | n/a | yes |
| <a name="input_gk_requests_memory"></a> [gk\_requests\_memory](#input\_gk\_requests\_memory) | n/a | `any` | n/a | yes |
| <a name="input_grafana_client_id"></a> [grafana\_client\_id](#input\_grafana\_client\_id) | n/a | `any` | n/a | yes |
| <a name="input_grafana_client_secret"></a> [grafana\_client\_secret](#input\_grafana\_client\_secret) | n/a | `any` | n/a | yes |
| <a name="input_kubecost_client_id"></a> [kubecost\_client\_id](#input\_kubecost\_client\_id) | n/a | `any` | n/a | yes |
| <a name="input_kubecost_client_secret"></a> [kubecost\_client\_secret](#input\_kubecost\_client\_secret) | n/a | `any` | n/a | yes |
| <a name="input_kubecost_cluster_profile"></a> [kubecost\_cluster\_profile](#input\_kubecost\_cluster\_profile) | n/a | `any` | n/a | yes |
| <a name="input_kubecost_product_key"></a> [kubecost\_product\_key](#input\_kubecost\_product\_key) | n/a | `any` | n/a | yes |
| <a name="input_kubecost_shared_namespaces"></a> [kubecost\_shared\_namespaces](#input\_kubecost\_shared\_namespaces) | n/a | `any` | n/a | yes |
| <a name="input_kubecost_slack_token"></a> [kubecost\_slack\_token](#input\_kubecost\_slack\_token) | n/a | `any` | n/a | yes |
| <a name="input_kubecost_storage_access_key"></a> [kubecost\_storage\_access\_key](#input\_kubecost\_storage\_access\_key) | n/a | `any` | n/a | yes |
| <a name="input_kubecost_storage_account"></a> [kubecost\_storage\_account](#input\_kubecost\_storage\_account) | n/a | `any` | n/a | yes |
| <a name="input_kubecost_storage_container"></a> [kubecost\_storage\_container](#input\_kubecost\_storage\_container) | n/a | `any` | n/a | yes |
| <a name="input_kubecost_token"></a> [kubecost\_token](#input\_kubecost\_token) | n/a | `any` | n/a | yes |
| <a name="input_kubernetes_identity_object_id"></a> [kubernetes\_identity\_object\_id](#input\_kubernetes\_identity\_object\_id) | Kubernetes identity object ID | `any` | n/a | yes |
| <a name="input_logging_elasticsearch_url"></a> [logging\_elasticsearch\_url](#input\_logging\_elasticsearch\_url) | URL to elasticsearch for logging | `any` | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Prefix for Azure resources | `any` | n/a | yes |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | Azure Subscription ID | `any` | n/a | yes |
| <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id) | Azure Tenant ID | `any` | n/a | yes |
| <a name="input_vault_address"></a> [vault\_address](#input\_vault\_address) | n/a | `any` | n/a | yes |
| <a name="input_additional_alertmanagers"></a> [additional\_alertmanagers](#input\_additional\_alertmanagers) | List of additional Alertmanager targets for the Platform Prometheus | `list(string)` | `[]` | no |
| <a name="input_global_fluentd_config"></a> [global\_fluentd\_config](#input\_global\_fluentd\_config) | Global Fluentd config, usually used to define the default plugin | `string` | `"<plugin default>\n  @type null\n</plugin>\n"` | no |
| <a name="input_infrastructure_pipeline_subnet_ids"></a> [infrastructure\_pipeline\_subnet\_ids](#input\_infrastructure\_pipeline\_subnet\_ids) | Subnet ID of infrastructure pipeline | `list(string)` | `[]` | no |
| <a name="input_kiali_grafana_token"></a> [kiali\_grafana\_token](#input\_kiali\_grafana\_token) | The token used to authentiate Kiali to Grafana. | `string` | `""` | no |
| <a name="input_kiali_resources"></a> [kiali\_resources](#input\_kiali\_resources) | The limits and requests to set on the Kiali pod. | <pre>object({<br>    limits = optional(object({<br>      cpu    = optional(string, "50m"),<br>      memory = optional(string, "256Mi"),<br>      }), {<br>      cpu    = "50m",<br>      memory = "256Mi",<br>    }),<br>    requests = optional(object({<br>      cpu    = optional(string, "10m"),<br>      memory = optional(string, "128Mi"),<br>      }), {<br>      cpu    = "10m",<br>      memory = "128Mi",<br>    }),<br>  })</pre> | `{}` | no |
| <a name="input_kubecost_additional_alert_config"></a> [kubecost\_additional\_alert\_config](#input\_kubecost\_additional\_alert\_config) | Additional alerts for kubecost to pick up. Default should never trigger | `string` | `"- type: budget\n  threshold: 100000000000000\n  window: 1d\n  aggregation: namespace\n  filter: default\n"` | no |
| <a name="input_kubecost_alert_slack_webhook_url"></a> [kubecost\_alert\_slack\_webhook\_url](#input\_kubecost\_alert\_slack\_webhook\_url) | Kubecost global url for reporting alerts | `string` | `"https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX"` | no |
| <a name="input_kubecost_prometheus_node_selector"></a> [kubecost\_prometheus\_node\_selector](#input\_kubecost\_prometheus\_node\_selector) | The nodeSelector to apply to the Prometheus instance backing Kubecost. | `map(string)` | `{}` | no |
| <a name="input_load_balancer_subnet"></a> [load\_balancer\_subnet](#input\_load\_balancer\_subnet) | Load balancer subnet | `any` | `null` | no |
| <a name="input_logging_elasticsearch_password"></a> [logging\_elasticsearch\_password](#input\_logging\_elasticsearch\_password) | Elasticsearch password for logging | `string` | `""` | no |
| <a name="input_logging_elasticsearch_username"></a> [logging\_elasticsearch\_username](#input\_logging\_elasticsearch\_username) | Elasticsearch username for logging | `string` | `""` | no |
| <a name="input_meshconfig_enable_tracing"></a> [meshconfig\_enable\_tracing](#input\_meshconfig\_enable\_tracing) | Flag to control generation of trace spans and request IDs. | `bool` | `false` | no |
| <a name="input_meshconfig_zipkin_address"></a> [meshconfig\_zipkin\_address](#input\_meshconfig\_zipkin\_address) | The URL to send zipkin compatible traces to | `string` | `"zipkin.istio-system:9411"` | no |
| <a name="input_prometheus_additional_scrape_config"></a> [prometheus\_additional\_scrape\_config](#input\_prometheus\_additional\_scrape\_config) | Default additional scrape configuration for prometheus | `string` | `"- job_name: kubecost\n  honor_labels: true\n  scrape_interval: 1m\n  scrape_timeout: 10s\n  metrics_path: /metrics\n  scheme: http\n  dns_sd_configs:\n  - names:\n    - kubecost-cost-analyzer.kubecost-system\n    type: 'A'\n    port: 9003\n  metric_relabel_configs:\n  - source_labels: [persistentvolumeclaim]\n    separator: ;\n    regex: (aaw-unclassified|aaw-protected-b|aaw-unclassified-ro|fdi.*unclassified|fdi.*protected-b)\n    replacement: $1\n    action: drop\n  - source_labels: [persistentvolume]\n    separator: ;\n    regex: (.*aaw-unclassified|.*aaw-protected-b|.*aaw-unclassified-ro|.*fdi-protected-b.*|.*fdi-unclassified.*)\n    replacement: $1\n    action: drop\n"` | no |
| <a name="input_prometheus_disk_size"></a> [prometheus\_disk\_size](#input\_prometheus\_disk\_size) | n/a | `string` | `"80Gi"` | no |
| <a name="input_prometheus_resources"></a> [prometheus\_resources](#input\_prometheus\_resources) | The limits and requests to set on the Prometheus pod. | <pre>object({<br>    limits   = optional(map(string), {}),<br>    requests = optional(map(string), {}),<br>  })</pre> | <pre>{<br>  "limits": {},<br>  "requests": {}<br>}</pre> | no |


<!-- END_TF_DOCS -->
