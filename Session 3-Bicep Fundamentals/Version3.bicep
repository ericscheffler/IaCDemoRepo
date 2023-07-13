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
