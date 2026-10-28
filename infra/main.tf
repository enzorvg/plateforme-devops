provider "helm" {
  kubernetes = {
    host                   = module.cluster.endpoint
    client_certificate     = module.cluster.client_certificate
    client_key             = module.cluster.client_key
    cluster_ca_certificate = module.cluster.cluster_ca_certificate
  }
}

module "cluster" {
  source = "./modules/cluster"
  nom    = "plateforme"
}

module "argocd" {
  source        = "./modules/argocd"
  version_chart = "10.10.3"
  depends_on    = [module.cluster]
}
