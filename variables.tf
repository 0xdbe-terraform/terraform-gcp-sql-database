variable "database_type" {
  type        = string
  description = "type and version of the database"
  default     = "POSTGRES_14"
}

variable "location_id" {
  type        = string
  description = "Location Identifier of your project"
}

variable "project_id" {
  type        = string
  description = "Identifier of your project"
}

variable "project_number" {
  type        = string
  description = "Number of your project (example: 596376125057)."
}

variable "role_cloudsql_editor_members" {
  type        = list(string)
  description = "List of users or service accounts need Cloud SQL Editor role"
}