# gke-terraform-app

Deploy a small JavaScript app to Google Kubernetes Engine (GKE) on GCP, with the
cluster and supporting infrastructure provisioned by Terraform.

## Stack

- GCP — cloud provider
- GKE Autopilot — managed Kubernetes (Google runs the nodes)
- Terraform — provisions the cluster, Artifact Registry, and supporting infra
- Artifact Registry — Docker image storage
- Node / Express — minimal sample app (`/` and `/healthz`)
- LoadBalancer Service — the external front door (Ingress/GCLB comes later)

## Status

In progress — see commit history.

## Architecture

The target setup. Terraform provisions the infrastructure on GCP, then the app deploys to a GKE Autopilot cluster. Built up as the project moves.

```text
🧱 Terraform
   │
   ▼
☁️ Google Cloud Platform
   │
   ├── 📦 Artifact Registry
   │      └── Stores app container image
   │
   └── 🚢 GKE Autopilot
          └── 🚀 Deployment
                 └── 🧩 Sample App Pods
                        └── 🌐 LoadBalancer Service
                               └── 🌍 External IP
                                      └── 👤 User
```
