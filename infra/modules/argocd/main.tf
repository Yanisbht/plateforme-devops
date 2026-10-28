resource "helm_release" "argocd" {
  name             = "argocd"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  version          = var.version_chart
  namespace        = "argocd"
  create_namespace = true
  timeout          = 600
}
