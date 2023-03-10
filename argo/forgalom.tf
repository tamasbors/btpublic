resource "helm_release" "traefik" {
  name       = "traefik"
  repository = "https://traefik.github.io/charts"
  namespace  = var.argocd_namespace
  chart      = "traefik"
  version    = "21.1.0"
}
