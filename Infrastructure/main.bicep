@description('The Azure region into which the resources should be deployed.')
param location string = resourceGroup().location

@description('A unique suffix to add to resource names that need to be globally unique.')
@maxLength(13)
param resourceNameSuffix string = uniqueString(resourceGroup().id)

var astleBeStorageAccountName = 'astlebesa${resourceNameSuffix}'

resource astleBeStorageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: astleBeStorageAccountName
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
}
