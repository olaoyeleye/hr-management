# HR-APP s3 bucket configuration backend variable declaration 
variable "bucket" {}
variable "key" {}

# HR-APP subnet names - 2 public and 1 private
variable "public_subnet_1_name" {}
variable "public_subnet_2_name" {}
variable "private_subnet_3_name" {}

# HR-APP CIDR block range - the private is for the database (postgress)
variable "public_subnet_1_cidr" {}
variable "public_subnet_2_cidr" {}
variable "private_subnet_3_cidr" {}

#  HR-APP security group name
variable "sg_name" {}

# postgressDB username and password
variable "rds_password" {}
variable "rds_username" {}


# EC2 Instance names
variable "hr-app-name-1" {}
variable "hr-app-name-2" {}
variable "hr-app-name-3" {}
variable "hr-app-name-4" {}
variable "hr-app-name-5" {}
variable "hr-app-jump-server" {}


variable "zone_id" {}




#Fundamental and neccessary parameters to supply
variable "default_tags" {}
variable "ami" {}
#variable "aws_region" {}
variable "key_name" {}






variable "aws_region" {
  description = "Region where the S3 bucket is deployed."
  type        = string
}

variable "domain" {
  description = "Domain that emails are sent from"
  type        = string
}

#variable "hosted_zone_domain" {
#  description = "Route 53 Hosted Zone domain"
#  type = string
#}
