# Terraform
 
< Document in progress...>

### Before you start

1) Download and Install Terraform.

    > Hashicorp - Install Terraform: https://learn.hashicorp.com/terraform/azure/install_az

    > Microsoft - Install and configure Terraform: https://docs.microsoft.com/en-us/azure/virtual-machines/linux/terraform-install-configure#install-terraform 

2) Set up and configure Terraform access to Azure.

    - To Set up account, go to this article: 
        > https://docs.microsoft.com/en-us/azure/virtual-machines/linux/terraform-install-configure#set-up-terraform-access-to-azure
    
### How to run

1) Clone repository and move to Terraform Folder
    > cd ./Terraform

1) Configure Azure RM details into console. 
    > source ./azurermconfig.sh

2) Move to the right folder for deployment. Ex. CreateVNET folder
    > cd ./CreateVNET

3) Use deploy.sh to execute Terraform init/plan/apply
    > ../deploy.sh
