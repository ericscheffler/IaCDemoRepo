resource vnet 'Microsoft.Network/virtualNetworks@2021-05-01' = {
  name: '1-VNET-NoParams'
  location: 'eastus'
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.1.0.0/16'
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
