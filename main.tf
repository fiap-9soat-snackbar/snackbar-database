# MongoDB Atlas

module "mongodb-atlas" {
  source  = "terraform-mongodbatlas-modules/atlas-basic/mongodbatlas"
  org_id = var.org_id
  project_name = "${var.product_name}-${var.release_name}"
  use_existing_project = true
  cluster_name = "${var.local_name}"
  provider_name = "TENANT"
  backing_provider_name = "AWS"
  region_name = "US_EAST_1"
  electable_specs = {
      instance_size = "M0"
  }

  ip_addresses = [var.my_ip, var.ec2_instance_public_ip]
  database_users = [
      {
        username = var.mongodbatlas_username
        password = var.mongodbatlas_password
        roles = [
            {
                role = "atlasAdmin"
                database = "admin"
            }
        ]
        scopes = [
            {
                name = "${var.local_name}"
                type = "CLUSTER"
            }
        ]
    },
    {
        username = var.MONGODB_USER
        password = var.MONGODB_PASSWORD
        roles = [
            {
                role = "readWrite"
                database = "snackbar"
            }
        ]
        scopes = [
            {
                name = "${var.local_name}"
                type = "CLUSTER"
            }
        ]
    }
  ]
  
}