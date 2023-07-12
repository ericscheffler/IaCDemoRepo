param vnets array

resource buildvnets 'Microsoft.Network/virtualNetworks@2021-05-01' = [for vnet in vnets: {
  name: vnet.name
  location: vnet.location
  properties: {
    addressSpace: {
      addressPrefixes: [
        vnet.addressPrefix
      ]
    }
    subnets: [
      {
        name: vnet.subnetName
        properties: {
          addressPrefix: vnet.subnetPrefix
        }
      }
    ]
  }
}]


/*
$rg= "erschef1"
$template= ".\version4.bicep"
$params= ".\version4.bicepparam"

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
