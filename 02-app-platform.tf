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

  source = "git::https://gitlab.k8s.cloud.statcan.ca/cloudnative/terraform/modules/terraform-statcan-kubernetes-app-platform.git?ref=v2.6.0"

  cluster_name          = var.prefix
  ingress_domain        = var.dns_zone_name
  administrative_groups = var.administrative_groups

  # Extra namespaces that the IstioOperator should watch
  istio_operator_additional_watch_namespaces = ["cloud-main-system"]

  load_balancer_subnet = var.load_balancer_subnet
  additional_istio_ingress_gateways = {
    "kubeflow" = {
      hosts                   = ["kubeflow.${var.dns_zone_name}"]
      certificate_secret_name = "wildcard-tls"
    },
    "authenticated" = {
      hosts                   = ["*"],
      certificate_secret_name = "wildcard-tls"
    },
    "kfserving" = {
      hosts                   = ["*"],
      certificate_secret_name = "wildcard-tls"
    },
    "protected-b" = {
      hosts                   = ["*"],
      certificate_secret_name = "wildcard-tls"
    }
  }

  kiali_prometheus_url = "http://${module.core_platform.kube_prometheus_stack_release_name}-prometheus.${module.core_platform.kube_prometheus_stack_namespace_name}:9090"

  kiali_grafana_configurations = {
    in_cluster_url = "http://${module.core_platform.kube_prometheus_stack_release_name}-grafana.${module.core_platform.kube_prometheus_stack_namespace_name}:80",
    url            = module.core_platform.grafana_url,
    token          = var.kiali_grafana_token,
  }
  kiali_resources = var.kiali_resources
}
