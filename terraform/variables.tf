variable "project_id" {
  description = "The GCP project ID where resources are created."
  type        = string
}

variable "region" {
  description = "Region for the cluster and Artifact Registry."
  type        = string
  default     = "us-east1"
}

variable "cluster_name" {
  description = "Name of the GKE Autopilot cluster."
  type        = string
  default     = "gke-terraform-app"
}

variable "repo_name" {
  description = "Name of the Artifact Registry repository for the app image."
  type        = string
  default     = "app-images"
}