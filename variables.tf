# Global variables

variable "product_name" {
  description = "Product name"
  type        = string
}

variable "release_name" {
  description = "Release name"
  type        = string
}

variable "local_name" {
  description = "Concatenation of product name, release name and environment"
  type        = string
}

variable "my_ip" {
  description = "My IP address"
  type        = string
}

variable "ec2_instance_public_ip" {
  description = "EC2 instance public IP address"
  type        = string
}

# MongoDB Atlas variables

variable "org_id" {
  description = "MongoDB Atlas Organization ID"
  type        = string
  sensitive   = true
}

variable "mongodbatlas_org_public_key" {
  description = "MongoDB Atlas Organization public key"
  type        = string
  sensitive   = true
}

variable "mongodbatlas_org_private_key" {
  description = "MongoDB Atlas Organization private key"
  type        = string
  sensitive   = true
}

variable "mongodbatlas_username" {
  description = "MongoDB Atlas username"
  type        = string
}

variable "mongodbatlas_password" {
  description = "MongoDB Atlas password"
  type        = string
  sensitive   = true
}

variable "MONGODB_USER" {
  description = "MongoDB username"
  type        = string
}

variable "MONGODB_PASSWORD" {
  description = "MongoDB password"
  type        = string
  sensitive   = true
}