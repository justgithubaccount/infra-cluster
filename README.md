# app-poly-gitops-terraform

Terraform модули для Timeweb Cloud. Часть экосистемы app-poly-gitops.

## Модули

### `modules/cluster`
Создание bare-metal серверов (VPS) для self-hosted кластера.

### `modules/timeweb-k8s`
Создание managed Kubernetes кластера в Timeweb Cloud.

```hcl
module "k8s" {
  source = "git::https://github.com/justgithubaccount/app-poly-gitops-terraform.git//modules/timeweb-k8s"

  cluster_name = "my-cluster"
  project_id   = 1115913
  network_id   = "network-xxx"
  node_count   = 3
}

output "kubeconfig" {
  value     = module.k8s.kubeconfig
  sensitive = true
}
```

## Связанные репозитории

- `app-poly-gitops-infra` — использует эти модули
- `app-poly-gitops-k8s` — GitOps манифесты
- `app-poly-gitops-helm` — Helm chart
- `app-poly-gitops-fastapi` — FastAPI сервис
- `app-poly-gitops-crewai` — CrewAI мониторинг