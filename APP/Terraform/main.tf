#Providing the user
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.100.0"
    }
  }
}
#Connecting to the AZURE Account
provider "azurerm" {
  #configuration options
  subscription_id ="8a8c1042-7b31-4fa9-9dde-5b99205a818f"  
  client_id = "404f44eb-6f85-4b1a-ba50-0b37dd251454"  
  client_secret ="ShW8Q~kWDt9cTSrPtK_.I0gVbA7a4sdEBeq~lb-n" 
  tenant_id = "ae3747b4-72a7-485b-b67e-abf72c43b1ea" 
  features {}
}

# create a resource group
resource "azurerm_resource_group" "Todolist" {
    name     = "Todolist" #This will be created in azure
    location = "North Europe"
}

resource "azurerm_sql_server" "leanix-sql-server" {
  name                         = "leanixsqlserver00001"
  resource_group_name          = azurerm_resource_group.Todolist.name
  location                     = azurerm_resource_group.Todolist.location
  version                      = "12.0"
  administrator_login          = "leanixadmin"
  administrator_login_password = "Av@dha@#K112Hh1$4"

  tags = {
    environment = "production"
  }
}

#CREATING A SQL DATABASE
resource "azurerm_sql_database" "leanix-sql-database" {
  name                = "leanixdb"
  resource_group_name = azurerm_resource_group.Todolist.name
  location            = azurerm_resource_group.Todolist.location
  server_name         = azurerm_sql_server.leanix-sql-server.name
  #sku_name            = "Basic"
  collation           = "SQL_Latin1_General_CP1_CI_AS"
  tags = {
    environment = "production"
  }
}
resource "azurerm_sql_firewall_rule" "leanixfirewall" {
  name                = "FirewallRule1"
  resource_group_name = azurerm_resource_group.Todolist.name
  server_name         = azurerm_sql_server.leanix-sql-server.name
  start_ip_address    = "176.198.202.232"
  end_ip_address      = "176.198.202.232"
}
