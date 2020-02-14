resource "template_dir" "config" {

  source_dir      = "${path.module}/k8s"
  destination_dir = "${path.cwd}/k8s_ready"

  vars = {
     rds_host_tmpl = "${aws_db_instance.default.address}"
     rds_pass_tmpl = "${var.rds-password}"
  }
}
