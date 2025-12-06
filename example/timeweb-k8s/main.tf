terraform {
  required_providers {
    twc = {
      source = "tf.timeweb.cloud/timeweb-cloud/timeweb-cloud"
    }
  }
  required_version = ">= 0.13"
}

provider "twc" {
  token = var.twc_token
}

module "k8s" {
  source = "../../modules/timeweb-k8s"

  cluster_name      = var.cluster_name
  project_id        = var.project_id
  network_id        = var.network_id
  cluster_preset_id = var.cluster_preset_id
  node_preset_id    = var.node_preset_id
  node_count        = var.node_count
  k8s_version       = var.k8s_version
  network_driver    = var.network_driver
  autoscaling       = var.autoscaling
}
