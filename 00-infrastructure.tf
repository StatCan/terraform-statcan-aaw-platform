###########################################################
# Stage 0: Deploy platform infrastructure
###########################################################

# Stage 1a: Deploy infrastructure components required for the platform
module "platform_infrastructure" {
  source = "git::https://gitlab.k8s.cloud.statcan.ca/cloudnative/terraform/modules/terraform-azure-statcan-cloud-native-platform-infrastructure.git"

  prefix       = var.prefix
  azure_region = var.azure_region
  tags         = var.azure_tags

  node_resource_group_name       = var.cluster_node_resource_group_name
  kubernetes_identity_object_id  = var.kubernetes_identity_object_id
  velero_storage_account_subnets = concat([var.aks_system_subnet_id], var.infrastructure_pipeline_subnet_ids)
  dns_zone_id                    = var.dns_zone_id
}
