resource "aws_route_table_association" "hr-app-association-1" {
  subnet_id      = aws_subnet.subnet_1_public.id
  route_table_id = aws_route_table.hr-app-public-rt.id
}

resource "aws_route_table_association" "hr-app-association-2" {
  subnet_id      = aws_subnet.subnet_2_public.id
  route_table_id = aws_route_table.hr-app-public-rt.id
}

#resource "aws_route_table_association" "hr-app-association-22" {
#  subnet_id      = aws_db_subnet_group.postgresdb-subnet.id
#  route_table_id = aws_route_table.hr-app-public-rt.id
#}


resource "aws_route_table_association" "hr-app-association-3" {
  subnet_id      = aws_subnet.subnet_3_private.id
  route_table_id = aws_route_table.hr-app-private-rt.id

}













