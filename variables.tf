variable "project_id" {
  type        = string
  description = "Identifier of your project"
}

variable "location_id" {
  type        = string
  description = "Location Identifier of your project"
  default     = "us-central"
}

variable "database_type" {
  type        = string
  description = "type and version of the database"
  default     = "POSTGRES_14"
}