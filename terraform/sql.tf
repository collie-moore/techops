# Assignment - Make it highly available with a primary and a secondary instance in different zones.
# Backup the database every day at 1am and keep it for 7 days.
# Backup to different regions.

resource "google_sql_database_instance" "default" {
  name             = "my-instance"
  database_version = "MYSQL_8_0"
  region           = "us-central1"
  settings {
    tier = "db-f1-micro"
  }
}

resource "google_sql_database" "default" {
  name     = "my-database"
  instance = google_sql_database_instance.default.name
  charset  = "utf8"
  collation = "utf8_general_ci"
}

resource "google_sql_user" "default" {
  name     = "my-user"
  instance = google_sql_database_instance.default.name
  password = "my-password"
  host     = "%"
}

