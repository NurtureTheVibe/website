resource "azurerm_dns_zone" "root" {
  name                = "nurturethevibe.com"
  resource_group_name = azurerm_resource_group.main.name
}

resource "azurerm_dns_cname_record" "www" {
  name                = "www"
  zone_name           = azurerm_dns_zone.root.name
  resource_group_name = azurerm_dns_zone.root.resource_group_name
  ttl                 = 300
  record              = azurerm_static_web_app.site.default_host_name
}
