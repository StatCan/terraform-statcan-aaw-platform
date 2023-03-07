###########################################################
# Stage 2: Deploy app platform
###########################################################

module "app_platform" {
  providers = {
    kubernetes = kubernetes
    helm       = helm
  }

  depends_on = [
    module.platform_infrastructure,
    module.core_platform,
  ]

  source = "git::https://gitlab.k8s.cloud.statcan.ca/cloudnative/terraform/modules/terraform-statcan-kubernetes-app-platform.git?ref=v4.1.0"

  cluster_name          = var.prefix
  tenant_id             = var.tenant_id
  ingress_domain        = var.dns_zone_name
  administrative_groups = var.administrative_groups

  # Istio Mesh config
  meshconfig_zipkin_address = var.meshconfig_zipkin_address
  meshconfig_enable_tracing = var.meshconfig_enable_tracing

  # Extra namespaces that the IstioOperator should watch
  istio_operator_additional_watch_namespaces = ["cloud-main-system"]

  load_balancer_subnet = var.load_balancer_subnet
  additional_istio_ingress_gateways = {
    "kubeflow" = {
      hosts                   = ["kubeflow.${var.dns_zone_name}"],
      certificate_secret_name = "kubeflow-tls",
      dns_names               = ["*.${var.dns_zone_name}"]
    },
    "authenticated" = {
      hosts                   = ["*"],
      certificate_secret_name = "authenticated-tls",
      dns_names               = ["*.auth.${var.dns_zone_name}", "*.${var.dns_zone_name}"]
    },
    "kfserving" = {
      hosts                   = ["*"],
      certificate_secret_name = "kfserving-tls",
      dns_names               = ["*.${var.dns_zone_name}"]
    },
    "protected-b" = {
      hosts                   = ["*"],
      certificate_secret_name = "protected-b-tls",
      dns_names               = ["*.protected-b.${var.dns_zone_name}", "*.${var.dns_zone_name}"]
    }
  }

  # Kiali configurations
  kiali_prometheus_url = "http://${module.core_platform.kube_prometheus_stack_release_name}-prometheus.${module.core_platform.kube_prometheus_stack_namespace_name}:9090"

  kiali_grafana_configurations = {
    in_cluster_url = "http://${module.core_platform.kube_prometheus_stack_release_name}-grafana.${module.core_platform.kube_prometheus_stack_namespace_name}:80",
    url            = module.core_platform.grafana_url,
    token          = var.kiali_grafana_token,
  }

  kiali_resources = var.kiali_resources

  # Argo Workflows

  argo_workflows_client_id                 = var.argo_workflows_client_id
  argo_workflows_client_secret             = var.argo_workflows_client_secret
  platform_workflows_storage_account_name  = module.platform_infrastructure.platform_workflows_storage_account_name
  platform_workflows_primary_access_key    = module.platform_infrastructure.platform_workflows_primary_access_key
  platform_workflows_primary_blob_endpoint = module.platform_infrastructure.platform_workflows_primary_blob_endpoint
}
