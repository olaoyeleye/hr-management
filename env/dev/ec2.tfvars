hr-app-name-1      = "HR-APP-Machine-1"
hr-app-name-2      = "HR-APP-Machine-2"
hr-app-name-3      = "HR-APP-Machine-3"
hr-app-name-4      = "Monitoring-server"
hr-app-name-5      = "db-server"
hr-app-jump-server = "Tool-Server"


public_subnet_1_name  = "HR-APP-public-subnet-1"
public_subnet_2_name  = "HR-APP-public-subnet-2"
private_subnet_3_name = "HR-APP-private-subnet-3"


public_subnet_1_cidr  = "10.0.1.0/24"
public_subnet_2_cidr  = "10.0.2.0/24"
private_subnet_3_cidr = "10.0.5.0/24"


sg_name      = "HR-APP-security-group"
rds_password = "Kehinde12"
rds_username = "kensko"

ami = "ami-01dd271720c1ba44f"

aws_region = "eu-west-1"
key_name   = "hr-management-key" #"techbleat-ket"


default_tags = {
  "Name"              = "HR-APP"
  "Owner"             = "Mr Kunle"
  "Status"            = "Critical"
  "Created_by"        = "IT Team"
  "Week End Shutdown" = "No"
  "Created Date"      = "22/08/2024"
}


#ses_domain

domain = "olakunleoyeleye123@gmail.com"
#hosted_zone_domain="KENSKO-HR-APPLICATION.COM"