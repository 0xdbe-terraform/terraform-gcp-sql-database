resource "google_sql_database_instance" "main" {
  database_version     = var.database_type
  deletion_protection  = "false"
  name                 = "db-instance-${var.project_id}"
  project              = var.project_id
  region               = var.location_id
  settings {
    tier               = "db-f1-micro"
  }
}

resource "google_sql_database" "main" {
  instance = google_sql_database_instance.main.name
  name     = "database-${var.project_id}"
  project  = var.project_id
}

resource "google_project_service" "sqladmin" {
  disable_dependent_services = true
  project = var.project_id
  service = "sqladmin.googleapis.com"
}

resource "google_project_iam_binding" "main" {
  members = var.role_cloudsql_editor_members
  project = var.project_id
  role    = "roles/cloudsql.editor"
}

resource "random_password" "main" {
  length           = 30
  min_upper        = 1
  min_lower        = 1
  min_numeric      = 1
  min_special      = 1
  special          = true
  override_special = "_%?!#()-[]<>,;*@="
}

resource "google_sql_user" "main" {
  name     = "db-user-${var.project_id}"
  instance = google_sql_database_instance.main.name
  password = random_password.main.result
  project  = var.project_id
}