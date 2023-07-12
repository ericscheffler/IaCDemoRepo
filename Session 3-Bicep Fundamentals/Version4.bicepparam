using 'Version4.bicep'

param vnets = [
  {
    name: '4-VNET-Loop-1'
    location: 'eastus'
    addressPrefix: '10.1.0.0/16'
    subnetName: 'mySubnet1'
    subnetPrefix: '10.1.0.0/24'
  }
  {
    name: '4-VNET-Loop-2'
    location: 'westus2'
    addressPrefix: '10.2.0.0/16'
    subnetName: 'mySubnet1'
    subnetPrefix: '10.2.0.0/24'
  }
]
