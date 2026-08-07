resource "azurerm_resource_group" "myrg" {

  for_each = var.rg_details
  name1tyagi     = each.value.name
  location = each.value.location

}


Tyagi my name is

resource "azurerm_virtual_network" "myvnet" {
    for_each = var.vnet_details
  name                = each.value.name
  location            = azurerm_resource_group.myrg[each.value.ram].location
  resource_group_name = azurerm_resource_group.myrg[each.value.ram].name
  address_space       = each.value.address_space
  
  }

  resource "azurerm_subnet" "mysubnet" {
    for_each = var.subnet_details
  name                 = each.value.name
  resource_group_name  = azurerm_resource_group.myrg[each.value.ram].name
  virtual_network_name = azurerm_virtual_network.myvnet[each.value.shyam].name
  address_prefixes     = each.value.address_prefixes

}

resource "azurerm_public_ip" "myip" {
    for_each = var.publicip_details
  name                = each.value.name
  resource_group_name = azurerm_resource_group.myrg[each.value.ram].name
  location            = azurerm_resource_group.myrg[each.value.ram].location
  allocation_method   = "Static"

  tags = {
    environment = "Tyagi_producation"
  }
}

resource "azurerm_bastion_host" "mybastaion" {
    for_each = var.bastaion_details
  name                = each.value.name
  location            = azurerm_resource_group.myrg[each.value.ram].location
  resource_group_name = azurerm_resource_group.myrg[each.value.ram].name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.mysubnet[each.value.subnet_kye].id
    public_ip_address_id = azurerm_public_ip.myip[each.value.pip_kye].id
  }
}
