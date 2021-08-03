terraform {
  required_providers {
    test = {
      source = "terraform.io/builtin/test"
    }

    aci = {
      source  = "netascode/aci"
      version = ">=0.2.0"
    }
  }
}

module "main" {
  source = "../.."

  name        = "CDP1"
  admin_state = true
}

data "aci_rest" "cdpIfPol" {
  dn = "uni/infra/cdpIfP-${module.main.name}"

  depends_on = [module.main]
}

resource "test_assertions" "cdpIfPol" {
  component = "cdpIfPol"

  equal "name" {
    description = "name"
    got         = data.aci_rest.cdpIfPol.content.name
    want        = module.main.name
  }

  equal "adminSt" {
    description = "adminSt"
    got         = data.aci_rest.cdpIfPol.content.adminSt
    want        = "enabled"
  }
}
