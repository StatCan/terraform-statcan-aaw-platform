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

  source = "git::https://gitlab.k8s.cloud.statcan.ca/cloudnative/terraform/modules/terraform-statcan-kubernetes-app-platform.git?ref=v1.0.0"

  cluster_name          = var.prefix
  ingress_domain        = var.dns_zone_name
  administrative_groups = var.administrative_groups

  load_balancer_subnet = var.load_balancer_subnet
  additional_istio_ingress_gateways = [
    {
      name                    = "kubeflow"
      hosts                   = ["kubeflow.${var.dns_zone_name}"]
      certificate_secret_name = "wildcard-tls"
    }
  ]
}
