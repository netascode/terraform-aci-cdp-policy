module "aci_cdp_policy" {
  source = "netascode/cdp-policy/aci"

  name        = "CDP1"
  admin_state = true
}
