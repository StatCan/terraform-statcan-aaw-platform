###########################################################
# Stage 1: Deploy core platform
###########################################################

module "core_platform" {
  providers = {
    kubernetes = kubernetes
    helm       = helm
  }

  depends_on = [
    module.platform_infrastructure
  ]

  source = "git::https://gitlab.k8s.cloud.statcan.ca/cloudnative/terraform/modules/terraform-statcan-kubernetes-core-platform.git?ref=v3.1.0"

  cluster_name = var.prefix

  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id

  cluster_resource_group_name      = var.cluster_resource_group_name
  cluster_node_resource_group_name = var.cluster_node_resource_group_name

  ingress_domain = var.dns_zone_name

  administrative_groups = var.administrative_groups

  # cert-manager
  cert_manager_identity_client_id  = module.platform_infrastructure.cert_manager_identity_client_id
  cert_manager_identity_id         = module.platform_infrastructure.cert_manager_identity_id
  cert_manager_resource_group_name = var.dns_zone_resource_group_name
  cert_manager_hosted_zone_name    = var.dns_zone_name
  cert_manager_subscription_id     = var.dns_zone_subscription_id

  # gatekeeper
  gk_replicas = var.gk_replicas

  gk_limits_cpu      = var.gk_limits_cpu
  gk_limits_memory   = var.gk_limits_memory
  gk_requests_cpu    = var.gk_requests_cpu
  gk_requests_memory = var.gk_requests_memory

  gk_audit_limits_cpu      = var.gk_audit_limits_cpu
  gk_audit_limits_memory   = var.gk_audit_limits_memory
  gk_audit_requests_cpu    = var.gk_audit_requests_cpu
  gk_audit_requests_memory = var.gk_audit_requests_memory

  # grafana
  grafana_client_id     = var.grafana_client_id
  grafana_client_secret = var.grafana_client_secret

  # kubecost
  # Merge in the configs from the modules variables with some specific ones.
  kubecost = merge(var.kubecost, {
    # Use the Authenticated Gateway
    ingress = {
      annotations = {
        "ingress.statcan.gc.ca/gateways" = "istio-system/authenticated-istio-ingress-gateway-https"
      }
    }
  })

  # prometheus
  additional_alertmanagers = var.additional_alertmanagers
  prometheus_disk_size     = var.prometheus_disk_size
  prometheus_resources     = var.prometheus_resources

  # vault
  vault_address = var.vault_address

  # velero
  backup_resource_group_name = module.platform_infrastructure.backup_resource_group_name
  velero_identity_client_id  = module.platform_infrastructure.velero_identity_client_id
  velero_identity_id         = module.platform_infrastructure.velero_identity_id
  velero_storage_account     = module.platform_infrastructure.velero_storage_account_name
  velero_storage_bucket      = module.platform_infrastructure.velero_storage_bucket_name

  # Fluentd
  global_fluentd_config = var.global_fluentd_config

  # Platform Event Logging
  logging_elasticsearch_url      = var.logging_elasticsearch_url
  logging_elasticsearch_username = var.logging_elasticsearch_username
  logging_elasticsearch_password = var.logging_elasticsearch_password
}
