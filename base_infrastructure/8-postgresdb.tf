resource "aws_db_parameter_group" "postgresdb-parameters" {
  name   = "postgresdb-params"
  family = "postgres13"   # "mariadb10.3"

  parameter {
    name  = "log_connections"   #"max_allowed_packet"
    value = "1"      #"16777216"
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_db_instance" "postresdb" {
  allocated_storage        = 5 # 100 GB of storage, gives us more IOPS than a lower number
  engine                   = "postgres"
  engine_version           = "13"
  instance_class           = "db.t3.medium" # use micro if you want to use the free tier
  identifier               = "postgresdb"
  db_name                  = "mydatabase"     # database name
  username                 = var.rds_username # username
  password                 = var.rds_password # password
  db_subnet_group_name     = aws_db_subnet_group.postgresdb-subnet.name
  parameter_group_name     = aws_db_parameter_group.postgresdb-parameters.name
  apply_immediately    = true
  #multi_az                 ="true"  # "false" # set to true to have high availability: 2 instances synchronized with each other
  vpc_security_group_ids   = [aws_security_group.hr-app-sg.id]
  storage_type             = "gp2"
  delete_automated_backups = true
  publicly_accessible      = true
  #backup_retention_period   = 30                                          # how long you’re going to keep your backups
  availability_zone         = "eu-west-1b"    #[aws_subnet.subnet_1_public.availability_zone] # prefered AZ
                            #  aws_subnet.subnet_1_public.availability_zone 
  #final_snapshot_identifier = "mariadb-final-snapshot"  
  # final snapshot when executing terraform destroy

  skip_final_snapshot = true

  tags = {
    Name = "postresdb-instance"
  }
}