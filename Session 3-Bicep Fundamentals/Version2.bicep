param vnetName string = '2-VNET-Params'
param location string = 'eastus'
param addressPrefix string = '10.1.0.0/16'

resource vnet 'Microsoft.Network/virtualNetworks@2021-05-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        addressPrefix
      ]
    }
    subnets: [
      {
        name: 'mySubnet1'
        properties: {
          addressPrefix: '10.1.0.0/24'
        }
      }
    ]
  }
}
/*
sl 'C:\Users\erschef\OneDrive - Microsoft\Code\Demo'
$rg= "erschef1"
$template= ".\version2.bicep"

az deployment group what-if `
    --name erschef-terminal-azcli-$(Get-Date -Format "MM-dd-yyyy'_'HHmm") `
    --resource-group $rg `
    --template-file $template

az deployment group create `
    --resource-group $rg `
    --template-file $template    
*/
