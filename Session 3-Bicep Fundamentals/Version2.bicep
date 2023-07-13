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
