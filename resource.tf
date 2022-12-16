resource "google_sql_database" "main" {
  name     = "database-${var.project_id}"
  instance = google_sql_database_instance.main.name
}

resource "google_sql_database_instance" "main" {
  name             = "db-instance-${var.project_id}"
  region           = var.location_id
  database_version = var.database_type
  settings {
    tier = "db-f1-micro"
  }
  deletion_protection  = "false"
}

resource "random_password" "main" {
  length           = 30
  special          = true
  override_special = "_%?!#()-[]<>,;*@="
  min_upper        = 1
  min_lower        = 1
  min_numeric      = 1
  min_special      = 1
}

resource "google_sql_user" "main" {
  name     = "db-user-${var.project_id}"
  instance = google_sql_database_instance.main.name
  password = random_password.main.result
}