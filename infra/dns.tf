resource "azurerm_dns_zone" "root" {
  name                = "nurturethevibe.com"
  resource_group_name = azurerm_resource_group.main.name
}

resource "null_resource" "dns_settle" {
  depends_on = [azurerm_dns_zone.root]

  provisioner "local-exec" {
    command = "sleep 30"
  }
}

resource "azurerm_dns_cname_record" "www" {
  name                = "www"
  zone_name           = azurerm_dns_zone.root.name
  resource_group_name = azurerm_resource_group.main.name
  ttl                 = 300
  record              = azurerm_static_web_app.site.default_host_name

  depends_on = [null_resource.dns_settle]
}
