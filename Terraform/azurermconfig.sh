#!/bin/sh
echo "Connect to Azure: "
echo "1.  Azure CLI"
echo "2.  Azure Service Principal and Client Secret"
echo "0.  Exit"
echo

echo -n "Enter your choice, or 0 for exit: "
read choice
echo

case $choice in
     1)
        echo "Connecting via Azure CLI..."
        az login

        echo -n "Enter your Azure Subscription ID: "
        read ARM_SUBSCRIPTION_ID
        az account set --subscription $ARM_SUBSCRIPTION_ID
     ;;
     2)
        echo "Setting environment variables for Terraform"
        
        echo -n "Enter your Azure Tenant ID: "
        read your_tenant_id
        export ARM_TENANT_ID=$your_tenant_id

        echo -n "Enter your Azure Subscription ID: "
        read your_subscription_id
        export ARM_SUBSCRIPTION_ID=$your_subscription_id
        
        echo -n "Enter your Azure App ID: "
        read your_appId
        export ARM_CLIENT_ID=$your_appId
        
        echo -n "Enter your Azure App Client Secret: "
        read your_client_secret
        export ARM_CLIENT_SECRET=$your_client_secret

        # Not needed for public, required for usgovernment, german, china
        export ARM_ENVIRONMENT=public
     ;;
     0)
        echo "EXIT!"
        break
     ;;
     *)
        echo "That is not a valid choice, try a number from 0 to 2."
     ;;
esac  
done

