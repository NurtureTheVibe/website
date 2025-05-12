# ---------- dns_root_alias.tf ----------
# root "@" record → alias to the Static Web App
resource "azurerm_dns_a_record" "apex_alias" {
  name                = "@"                                         # apex
  zone_name           = azurerm_dns_zone.root.name
  resource_group_name = azurerm_dns_zone.root.resource_group_name
  ttl                 = 60

  target_resource_id  = azurerm_static_web_app.site.id              # magic bit
}
