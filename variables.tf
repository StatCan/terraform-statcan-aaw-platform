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
  sensitive   = true
}

variable "tenant_id" {
  description = "Azure Tenant ID"
  sensitive   = true
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
  sensitive   = true
}

variable "aks_system_subnet_id" {
  description = "AKS System subnet ID"
  sensitive   = true
}

variable "dns_zone_name" {
  description = "Name of the dns zone"
}

variable "dns_zone_id" {
  description = "Azure DNS Zone ID"
  sensitive   = true
}

variable "dns_zone_resource_group_name" {
  description = "Azure DNS Zone ID"
}

variable "dns_zone_subscription_id" {
  description = "Azure DNS Zone ID"
  sensitive   = true
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
  sensitive = true

}

variable "grafana_client_secret" {
  sensitive = true

}

# KubeCost

variable "kubecost_cluster_profile" {

}

variable "kubecost_token" {
  sensitive = true

}

variable "kubecost_client_id" {
  sensitive = true

}

variable "kubecost_client_secret" {
  sensitive = true

}

variable "kubecost_product_key" {
  sensitive = true

}

variable "kubecost_prometheus_node_selector" {
  description = "The nodeSelector to apply to the Prometheus instance backing Kubecost."
  type        = map(string)
  default     = {}
}

variable "kubecost_storage_account" {

}

variable "kubecost_storage_access_key" {
  sensitive = true

}

variable "kubecost_storage_container" {

}

variable "kubecost_shared_namespaces" {

}

variable "kubecost_slack_token" {
  sensitive = true

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

variable "prometheus_additional_scrape_config" {
  description = "Default additional scrape configuration for prometheus"

  default = <<EOF
- job_name: kubecost
  honor_labels: true
  scrape_interval: 1m
  scrape_timeout: 10s
  metrics_path: /metrics
  scheme: http
  dns_sd_configs:
  - names:
    - kubecost-cost-analyzer.kubecost-system
    type: 'A'
    port: 9003
  metric_relabel_configs:
  - source_labels: [persistentvolumeclaim]
    separator: ;
    regex: (aaw-unclassified|aaw-protected-b|aaw-unclassified-ro|fdi.*unclassified|fdi.*protected-b)
    replacement: $1
    action: drop
  - source_labels: [persistentvolume]
    separator: ;
    regex: (.*aaw-unclassified|.*aaw-protected-b|.*aaw-unclassified-ro|.*fdi-protected-b.*|.*fdi-unclassified.*)
    replacement: $1
    action: drop
EOF
}

variable "prometheus_resources" {
  description = "The limits and requests to set on the Prometheus pod."
  type = object({
    limits   = optional(map(string), {}),
    requests = optional(map(string), {}),
  })
  default = {
    limits   = {},
    requests = {},
  }
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

# Kiali

variable "kiali_grafana_token" {
  sensitive   = true
  description = "The token used to authentiate Kiali to Grafana."
  default     = ""
}

# This needed to be objects instead of maps so that the kubernetes provider wouldn't complain.
variable "kiali_resources" {
  description = "The limits and requests to set on the Kiali pod."
  type = object({
    limits = optional(object({
      cpu    = optional(string, "50m"),
      memory = optional(string, "256Mi"),
      }), {
      cpu    = "50m",
      memory = "256Mi",
    }),
    requests = optional(object({
      cpu    = optional(string, "10m"),
      memory = optional(string, "128Mi"),
      }), {
      cpu    = "10m",
      memory = "128Mi",
    }),
  })
  default  = {}
  nullable = false

  validation {
    condition     = var.kiali_resources.limits != null && var.kiali_resources.requests != null
    error_message = "Limits and requests cannot be null."
  }

  validation {
    condition     = var.kiali_resources.limits.cpu != null && var.kiali_resources.limits.memory != null
    error_message = "CPU and memory limits cannot be null."
  }

  validation {
    condition     = var.kiali_resources.requests.cpu != null && var.kiali_resources.requests.memory != null
    error_message = "CPU and memory requests cannot be null."
  }
}

variable "meshconfig_zipkin_address" {
  description = "The URL to send zipkin compatible traces to"
  default     = "zipkin.istio-system:9411"
  type        = string
}

variable "meshconfig_enable_tracing" {
  description = "Flag to control generation of trace spans and request IDs."
  default     = false
  type        = bool
}

# Argo Workflows

variable "argo_workflows_client_id" {
  description = "The Client ID for Argo Workflows"
  sensitive   = true
}

variable "argo_workflows_client_secret" {
  description = "The Client Secret for Argo Workflows"
  sensitive   = true
}
