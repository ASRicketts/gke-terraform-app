resource "google_artifact_registry_repository" "app" {
  location      = var.region
  repository_id = var.repo_name
  format        = "DOCKER"
  description   = "Docker images for the sample app"
}