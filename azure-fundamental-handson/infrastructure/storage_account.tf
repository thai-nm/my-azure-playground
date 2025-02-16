resource "azurerm_storage_account" "afh" {
  name                     = local.project
  resource_group_name      = azurerm_resource_group.afh.name
  location                 = azurerm_resource_group.afh.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  # Allow blob public access
  allow_nested_items_to_be_public = true
  https_traffic_only_enabled      = false
}

resource "azurerm_storage_account_static_website" "afh" {
  storage_account_id = azurerm_storage_account.afh.id
  error_404_document = "error.html"
  index_document     = "index.html"
}

# resource "azurerm_storage_blob" "index-html" {
#   storage_account_name   = azurerm_storage_account.afh.name
#   name                   = azurerm_storage_account_static_website.afh.index_document
#   storage_container_name = "$web"
#   type                   = "Block"
#   content_type           = "text/html"
#   source                 = abspath("../frontend/index.html")
# }

# resource "azurerm_storage_blob" "error-html" {
#   storage_account_name   = azurerm_storage_account.afh.name
#   name                   = azurerm_storage_account_static_website.afh.error_404_document
#   storage_container_name = "$web"
#   type                   = "Block"
#   content_type           = "text/html"
#   source                 = abspath("../frontend/error.html")
# }

# resource "azurerm_storage_blob" "script-js" {
#   storage_account_name   = azurerm_storage_account.afh.name
#   name                   = "script.js"
#   storage_container_name = "$web"
#   type                   = "Block"
#   content_type           = "application/javascript"
#   source                 = abspath("../frontend/script.js")
# }

# resource "azurerm_storage_blob" "style-css" {
#   storage_account_name   = azurerm_storage_account.afh.name
#   name                   = "styles.css"
#   storage_container_name = "$web"
#   type                   = "Block"
#   content_type           = "text/css"
#   source                 = abspath("../frontend/styles.css")
# }