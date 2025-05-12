resource "azurerm_static_web_app" "site" {
  name                = "swapp-vibe"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  sku_size            = "Standard"
}

output "static_hostname" {
  value = azurerm_static_web_app.site.default_host_name
}
