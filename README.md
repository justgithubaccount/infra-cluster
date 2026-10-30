# Timeweb Cloud Terraform Modules

Reusable Terraform modules for Timeweb Cloud infrastructure used by the
`app-poly-gitops` engineering lab.

## Modules

### `modules/timeweb-k8s`

Creates one managed Kubernetes cluster and one worker node group. The caller
supplies cluster and node preset IDs, or accepts the module defaults. Project and
network IDs are optional; `null` lets the provider use the account defaults.

Inputs include the cluster name, Kubernetes version, network driver, worker
count, and autoscaling flag. Outputs expose the cluster ID, cluster name, node
group ID, and sensitive kubeconfig.

~~~hcl
module "k8s" {
  source = "git::https://github.com/justgithubaccount/infra-cluster.git//modules/timeweb-k8s?ref=v0.1.0"

  cluster_name      = "example-cluster"
  cluster_preset_id = var.cluster_preset_id
  node_preset_id    = var.node_preset_id
  node_count        = 1
}
~~~

The provisioning repository selects current presets dynamically before calling
this module; see
[app-poly-gitops-infra](https://github.com/justgithubaccount/app-poly-gitops-infra).

### `modules/cluster`

Creates groups of Timeweb Cloud servers for a self-managed cluster: configurable
master and client counts, server resources, operating system, and cloud-init
payloads. This module does not install Kubernetes.

## Getting started

Both modules use the official `timeweb-cloud/timeweb-cloud` provider with the
`~> 1.8` constraint. Configure provider credentials outside source control,
then initialize and validate the selected module:

~~~bash
terraform -chdir=modules/timeweb-k8s init -backend=false
terraform -chdir=modules/timeweb-k8s validate
~~~

Runnable configuration examples are under `example/timeweb-k8s` and
`example/cluster`. Copy their `terraform.tfvars.example` files and replace
placeholders locally before any plan or apply.

## Repository structure

- `modules/timeweb-k8s/` — managed Kubernetes cluster and worker group
- `modules/cluster/` — raw server groups for self-managed setups
- `example/` — caller examples for both modules
- `tests/test_timeweb_module.sh` — provider and module contract checks

## Validation

~~~bash
bash tests/test_timeweb_module.sh
terraform fmt -check -recursive
terraform -chdir=modules/timeweb-k8s validate
terraform -chdir=modules/cluster validate
~~~

These commands are offline configuration checks after provider initialization;
they do not provision infrastructure.

## Related repositories

- [app-poly-gitops-infra](https://github.com/justgithubaccount/app-poly-gitops-infra) — managed-cluster caller and Argo CD bootstrap
- [app-poly-gitops-k8s](https://github.com/justgithubaccount/app-poly-gitops-k8s) — GitOps desired state
- [app-mono-gitops](https://github.com/justgithubaccount/app-mono-gitops) — archived predecessor
