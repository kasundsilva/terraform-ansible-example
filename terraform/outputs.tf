/*output "private_subnets" {
  value = "${join(",", aws_subnet.private.*.id)}"
}

output "public_subnets" {
  value = "${join(",", aws_subnet.public.*.id)}"
}

output "vpc_id" {
  value = "${aws_vpc.mod.id}"
}

output "public_route_table_id" {
  value = "${aws_route_table.public.id}"
}

output "private_route_table_id" {
  value = "${aws_route_table.private.id}"
}

output "address" {
  value = "${aws_instance.web.public_ip}"
}

output "ssh" {
  value = "ssh ${local.vm_user}@${aws_instance.web.public_ip}"
}*/
