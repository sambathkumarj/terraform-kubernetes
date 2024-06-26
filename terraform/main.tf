provider "local" {
  # This provider is used to execute local commands and manage files
}

resource "null_resource" "install_microk8s" {
  provisioner "local-exec" {
    command = "./install_microk8s.sh"
  }
}

resource "null_resource" "configure_microk8s" {
  provisioner "local-exec" {
    command = <<-EOT
      microk8s status --wait-ready
      microk8s kubectl get nodes
    EOT
  }

  depends_on = [null_resource.install_microk8s]
}

