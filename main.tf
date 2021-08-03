resource "aci_rest" "cdpIfPol" {
  dn         = "uni/infra/cdpIfP-${var.name}"
  class_name = "cdpIfPol"
  content = {
    name    = var.name
    adminSt = var.admin_state == true ? "enabled" : "disabled"
  }
}
