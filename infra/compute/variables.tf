variable "project_id" {
  description = "Project ID of the GCP project where resources will be deployed"
  type        = string
}

variable "host_networking_project" {
  description = "Project that contains the host network (VPC)"
  type        = string
}

variable "subnet_name" {
  description = "Name of the host VPC"
  type        = string
}

variable "location" {
  description = "Location (region) where resources will be deployed"
  type        = string
  default     = "europe-west4"
}

variable "zone" {
  description = "Zone where resources will be deployed"
  type        = string
  default     = "europe-west4-a"
}
