# Provision a Web app with a SQL Database

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Falesaez%2FAzure-Infrastructure-as-Code%2Fmaster%2FARMTemplates%2Fweb-app-sql-database%2Fazuredeploy.json" 
target="_blank">
    <img src="https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazure.png"/>
</a>
<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2Falesaez%2FAzure-Infrastructure-as-Code%2Fmaster%2FARMTemplates%2Fweb-app-sql-database%2Fazuredeploy.json" target="_blank">
    <img src="https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/visualizebutton.png"/>
</a>

This sample is based on [201-wep-app-sql-database](https://github.com/Azure/azure-quickstart-templates/tree/master/201-web-app-sql-database) that creates a free Azure Web App and SQL Database at the "Basic" service level. The main difference is the previous template currently uses Classic Alerts which are no longer supported, instead this sample also new Alert rules. 

The template can support other tiers of service, details for each service can be found here:

[App Service Pricing](https://azure.microsoft.com/en-us/pricing/details/app-service/)    
[SQL Database Pricing](https://azure.microsoft.com/en-us/pricing/details/sql-database/)

