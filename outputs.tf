output "dn" {
  value       = aci_rest.cdpIfPol.id
  description = "Distinguished name of `cdpIfPol` object."
}

output "name" {
  value       = aci_rest.cdpIfPol.content.name
  description = "CDP interface policy name."
}
