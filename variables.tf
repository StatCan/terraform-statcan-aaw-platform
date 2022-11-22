variable "prefix" {
  description = "Prefix for Azure resources"
}

variable "azure_region" {
  description = "Region to deploy Azure resources in"
}

variable "azure_tags" {
  type        = map(string)
  description = "Tags to apply to Azure resources"
}

variable "subscription_id" {
  description = "Azure Subscription ID"
}

variable "tenant_id" {
  description = "Azure Tenant ID"
}

variable "administrative_groups" {
  type        = list(string)
  description = "List of administrative groups"
}

variable "cluster_resource_group_name" {
  description = "Name of resource group containing the AKS cluster"
}

variable "cluster_node_resource_group_name" {
  description = "Name of resource group containing the AKS cluster nodes"
}

variable "kubernetes_identity_object_id" {
  description = "Kubernetes identity object ID"
}

variable "aks_system_subnet_id" {
  description = "AKS System subnet ID"
}

variable "dns_zone_name" {
  description = "Name of the dns zone"
}

variable "dns_zone_id" {
  description = "Azure DNS Zone ID"
}

variable "dns_zone_resource_group_name" {
  description = "Azure DNS Zone ID"
}

variable "dns_zone_subscription_id" {
  description = "Azure DNS Zone ID"
}

variable "load_balancer_subnet" {
  description = "Load balancer subnet"
  default     = null
}

variable "infrastructure_pipeline_subnet_ids" {
  type        = list(string)
  description = "Subnet ID of infrastructure pipeline"

  default = []
}

# gatekeeper controller pods

variable "gk_replicas" {

}

variable "gk_limits_cpu" {

}

variable "gk_requests_cpu" {

}

variable "gk_limits_memory" {

}

variable "gk_requests_memory" {

}

# gatekeeper audit pods

variable "gk_audit_limits_cpu" {

}

variable "gk_audit_requests_cpu" {

}

variable "gk_audit_limits_memory" {

}

variable "gk_audit_requests_memory" {

}

# Grafana

variable "grafana_client_id" {

}

variable "grafana_client_secret" {

}

# KubeCost

variable "kubecost_cluster_profile" {

}

variable "kubecost_token" {

}

variable "kubecost_client_id" {

}

variable "kubecost_client_secret" {

}

variable "kubecost_product_key" {

}

variable "kubecost_prometheus_node_selector" {
  description = "The nodeSelector to apply to the Prometheus instance backing Kubecost."
  type        = map(string)
  default     = {}
}

variable "kubecost_storage_account" {

}

variable "kubecost_storage_access_key" {

}

variable "kubecost_storage_container" {

}

variable "kubecost_shared_namespaces" {

}

variable "kubecost_slack_token" {

}

# Vault

variable "vault_address" {

}

# Prometheus

variable "prometheus_disk_size" {
  default = "80Gi"
}

variable "additional_alertmanagers" {
  description = "List of additional Alertmanager targets for the Platform Prometheus"
  type        = list(string)
  default     = []
}

# Fluentd
variable "global_fluentd_config" {
  description = "Global Fluentd config, usually used to define the default plugin"

  default = <<EOF
<plugin default>
  @type null
</plugin>
EOF
}
