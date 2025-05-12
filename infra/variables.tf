variable "location" {
  description = "Azure region to deploy resources in"
  type        = string
  default     = "UK South"
}

variable "tenant_id" {
  description = "Azure AD tenant ID (injected via environment variable)"
  type        = string
}

variable "subscription_id" {
  description = "Azure subscription ID (injected via environment variable)"
  type        = string
}

variable "client_id" {
  description = "Service‑principal / app‑registration client ID"
  type        = string
}
