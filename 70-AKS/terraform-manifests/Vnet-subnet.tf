resource "azurerm_resource_group" "myrg_1" {
  name = "myrg-1"
  location = "East US"
  
}

resource "azurerm_virtual_network" "myvnet_1" {
  name = "myvnet-1"
  location = azurerm_resource_group.myrg_1.location
  resource_group_name = azurerm_resource_group.myrg_1.name
  address_space = [ "10.0.0.0/16" ]
  
}

resource "azurerm_subnet" "subnet_1" {
  name = "subnet-1"
  virtual_network_name = azurerm_virtual_network.myvnet_1.name
  resource_group_name = azurerm_resource_group.myrg_1.name
  address_prefixes = [ "10.0.0.0/24" ]
  delegation {
    name = "Sample-delegation"
    service_delegation {
      name = "Microsoft.ContainerInstance/containerGroups"
      actions = [ "Microsoft.Network/virtualNetworks/subnets/action" ]
    }
  }
}