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
