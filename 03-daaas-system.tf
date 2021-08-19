resource "kubernetes_namespace" "daaas_system" {
  metadata {
    name = "daaas-system"

    labels = {
      "istio-injection"                                = "enabled"
      "namespace.statcan.gc.ca/purpose"                = "daaas"
      "network.statcan.gc.ca/allow-ingress-controller" = "true"
    }
  }
}

module "namespace_daaas_system" {
  source = "git::https://github.com/canada-ca-terraform-modules/terraform-kubernetes-namespace.git?ref=v2.2.0"

  name = kubernetes_namespace.daaas_system.id
  namespace_admins = {
    users  = []
    groups = var.administrative_groups
  }

  # CI/CD
  ci_name = "ci"

  # Dependencies
  dependencies = []
}
