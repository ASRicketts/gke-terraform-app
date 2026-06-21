# Build Log — gke-terraform-app

A journal for building this project: what I did, why I made each decision, and what broke.

---

## Stage 0 — Planning and tool choices

**Why GCP.** I wanted real cloud experience beyond the homelab. GCP has a $300 free trial.

**Why GKE Autopilot, not Standard.** Google manages the nodes, scaling, and upgrades

**Why Terraform.** Infrastructure as code is the skill I'm after.

**Why Application Default Credentials.** `gcloud auth application-default login` stores a credential locally that Terraform picks up automatically.

**Why Node 24 and Express 5.** Node 24 is the current Active LTS; Express 5 is the current stable. The app is a placeholder to prove the pipeline.

---

## Stage 1 — Repo and project setup

**Repo.** Created `ASRicketts/gke-terraform-app` on GitHub. First commit: README, `.gitignore`, LICENSE. Second commit: the sample app (`server.js`, `package.json`, `Dockerfile`, `.dockerignore`).

**Local tooling.** Installed on Fedora via vendor repos:

- `gcloud version` → Google Cloud SDK 572.0.0
- `kubectl version --client` → v1.35.3
- `terraform version` → Terraform v1.15.6
- `docker version` → 29.5.3

Fedora uses dnf5 now, which changed the syntax for adding repos — `dnf config-manager addrepo --from-repofile=` instead of the old `--add-repo`.

**GCP project.** Created project `gke-terraform-app-asr` via `gcloud projects create`.

**Billing.** Linked the billing account with `gcloud billing projects link`.

**APIs.** Enabled the three APIs the project needs:

- `container.googleapis.com` — GKE itself
- `artifactregistry.googleapis.com` — Docker image storage
- `compute.googleapis.com` — GKE runs on top of Compute Engine even in Autopilot mode

**Things still to do:**

- Set up Application Default Credentials for Terraform (`gcloud auth application-default login`)

---
