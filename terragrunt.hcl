# stage/terragrunt.hcl

#Keep your provider configuration DRY
generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "azurerm" {
  version = "=2.20.0"
  features {}
}
EOF
}

#Keep your backend configuration DRY
remote_state {
  backend = "azurerm"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
	resource_group_name  = "Ajinkya-RG1"
    storage_account_name = "store1822"
    container_name       = "tfstate2"
	key = "${path_relative_to_include()}/terraform.tfstate"
  }
}
