output "fatched_info_form_aws" {
    value = ["${aws_iam_role.test_role.*.id}"]

  
}
output "instance_public_ips" {
  value = { for instance_key, instance in aws_instance.rakesh_test : instance_key => instance.public_ip }
}
