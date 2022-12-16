# terraform-gcp-sql-database

Terraform module to create a Cloud SQL Database

## Usage

```
module "gcp_sql_database" {
  source               = "git::https://github.com/0xdbe-terraform/terraform-gcp-sql-database.git?ref=v1.0.0"
  project_id           = module.gcp_project.project_id
}
```