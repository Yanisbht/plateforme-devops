resource "kind_cluster" "plateforme" {
  name           = "plateforme"
  wait_for_ready = true
}

provider "helm" {
  kubernetes {
    host                   = kind_cluster.plateforme.endpoint
    client_certificate     = kind_cluster.plateforme.client_certificate
    client_key             = kind_cluster.plateforme.client_key
    cluster_ca_certificate = kind_cluster.plateforme.cluster_ca_certificate
  }
}

resource "helm_release" "argocd" {
  name             = "argocd"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  version          = "10.10.3"
  namespace        = "argocd"
  create_namespace = true
  timeout          = 600
}
