@description('The name of the VNET')
param vnetName string

@description('Region to create the VNET')
@allowed([
  'eastus'
  'westus2'
  'southeastasia'
])
param location string

@description('Address range for the VNET')
param addressPrefix string

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
$template= ".\version3.bicep"
$params= ".\version3.bicepparam"

az deployment group what-if `
    --name erschef-terminal-azcli-$(Get-Date -Format "MM-dd-yyyy'_'HHmm") `
    --resource-group $rg `
    --template-file $template `
    --parameters $params


az deployment group create `
    --resource-group $rg `
    --template-file $template `
    --parameters $params
*/
