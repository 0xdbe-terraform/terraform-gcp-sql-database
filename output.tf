output "database_name" {
  value = google_sql_database.main.name
}

output "database_hostname" {
  value = google_sql_database_instance.main.connection_name
}

output "database_username" {
  value = google_sql_user.main.name
}

output "database_password" {
  value = random_password.main.result
}
