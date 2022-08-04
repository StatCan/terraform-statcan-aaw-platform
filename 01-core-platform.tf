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

  source = "git::https://github.com/statcan/terraform-statcan-kubernetes-core-platform.git?ref=v1.5.7"

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

  # kubecost
  kubecost_cluster_profile          = var.kubecost_cluster_profile
  kubecost_token                    = var.kubecost_token
  kubecost_client_id                = var.kubecost_client_id
  kubecost_client_secret            = var.kubecost_client_secret
  kubecost_product_key              = var.kubecost_product_key
  kubecost_prometheus_node_selector = var.kubecost_prometheus_node_selector
  kubecost_storage_account          = var.kubecost_storage_account
  kubecost_storage_access_key       = var.kubecost_storage_access_key
  kubecost_storage_container        = var.kubecost_storage_container
  kubecost_shared_namespaces        = var.kubecost_shared_namespaces
  kubecost_slack_token              = var.kubecost_slack_token

  # prometheus
  prometheus_disk_size = var.prometheus_disk_size

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
}
