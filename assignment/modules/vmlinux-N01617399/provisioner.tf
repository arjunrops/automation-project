# resource "null_resource" "display_hostnames" {
#   count      = var.nb_count
#   depends_on = [azurerm_linux_virtual_machine.vm-linux]

#   provisioner "remote-exec" {
#     inline = ["/usr/bin/hostname"]
#     connection {
#       type        = "ssh"
#       user        = var.admin_username
#       private_key = file(var.private_key)
#       host        = element(azurerm_public_ip.vm-linux-pip[*].fqdn, count.index + 1)
#     }
#   }

# }

# variable "private_key" {
#   type    = string
#   default = "/home/arjunsinghroperia/.ssh/id_rsa"
# }

resource "null_resource" "ansible_provisioner" {
  count      = var.nb_count
  depends_on = [azurerm_linux_virtual_machine.vm-linux]

  provisioner "local-exec" {
    command = "ansible-playbook -i /home/arjunsinghroperia/automation/automation-project/ansible/linux_hosts /home/arjunsinghroperia/automation/automation-project/ansible/n01617399-playbook.yml"
  }

}

variable "private_key" {
  type    = string
  default = "/home/arjunsinghroperia/.ssh/id_rsa"
}