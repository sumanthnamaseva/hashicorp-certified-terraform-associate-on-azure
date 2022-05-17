resource "azurerm_kubernetes_cluster" "mykube_1" {
  name = "mykube-1"
  resource_group_name = azurerm_resource_group.myrg_1.name
  node_resource_group = azurerm_resource_group.myrg_1.name
  location = azurerm_resource_group.myrg_1.location
  dns_prefix = "dns-demo"

  identity {
    type = "SystemAssigned"
  }
  

  default_node_pool {
    name = "defaultpool"
    node_count = 1
    vm_size = "Standard_D2_v2"
    vnet_subnet_id = azurerm_subnet.subnet_1.id
  
  }
  
}