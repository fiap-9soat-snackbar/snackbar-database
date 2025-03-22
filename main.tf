module "mongodb-atlas" {
  source  = "terraform-mongodbatlas-modules/atlas-basic/mongodbatlas"
  org_id = var.org_id
  project_name = "snackbar"
  #project_name = data.terraform_remote_state.global.outputs.project_name
  use_existing_project = true
  cluster_name = data.terraform_remote_state.global.outputs.mongodb_cluster_name
  provider_name = data.terraform_remote_state.global.outputs.mongodb_provider_name
  backing_provider_name = data.terraform_remote_state.global.outputs.mongodb_backing_provider_name
  region_name = "US_EAST_1"
  ip_addresses = ["201.87.82.209"]
  #cidr_blocks = ["10.30.0.0/16"]
  electable_specs = {
      instance_size = data.terraform_remote_state.global.outputs.mongodb_instance_size
  }

  #ip_addresses = [var.my_ip, var.ec2_instance_public_ip]

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
                name = data.terraform_remote_state.global.outputs.mongodb_cluster_name
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
                name = data.terraform_remote_state.global.outputs.mongodb_cluster_name
                type = "CLUSTER"
            }
        ]
    }
  ]
  
}