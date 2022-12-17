# terraform-gcp-sql-database

Terraform module to create a Cloud SQL Database for Google App Engine.

## Usage

- Define needed vars in ``variables.tf``

```
variable "location_id" {
  type        = string
  description = "Location Identifier of your project"
}
```

- Assign vars in ``terraform.tfvars``

``
location_id = "us-central1"
```

- Use module

```
module "gcp_sql_database" {
  source               = "git::https://github.com/0xdbe-terraform/terraform-gcp-sql-database.git?ref=<TAG>"
  project_id           = module.gcp_project.project_id
  project_number       = module.gcp_project.project_number
  location_id          = var.location_id
}
```
