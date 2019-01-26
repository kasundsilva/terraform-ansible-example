output "private_subnets_ids" {
  value = "${join(",", aws_subnet.private_subnets.*.id)}"
}

output "public_subnets_ids" {
  value = "${join(",", aws_subnet.public_subnets.*.id)}"
}

output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}

output "public_route_table_id" {
  value = "${aws_route_table.public_route_table.id}"
}

output "private_route_table_id" {
  value = "${aws_route_table.private_route_table.id}"
}


output "nginx_security_group_id" {
  value = "${aws_security_group.nginx_security_group.id}"
}
