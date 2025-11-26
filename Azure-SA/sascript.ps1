

param (
    [string]$ResourseGroupName = "az-104learnsa-rg",
    [string]$StorageAccountName,
    [string]$Location = "ukwest",
    [string]$Kind = "StorageV2",
    [string]$SkuName = "Standard_LRS"
)

$sa_id = Get-Random -Minimum 10000 -Maximum 99999

if (-not $StorageAccountName){
    $StorageAccountName = "learnsaaz104$sa_id"
}

#Login to Azure account
Connect-AzAccount 

Write-Host "/// creating resource group $ResourceGroupName ..."
New-AzResourceGroup `
 -Name $ResourseGroupName `
 -Location $Location
Write-Host "/// resource group created."

Write-Host "/// creating storage account $StorageAccountName ..."
New-AzStorageAccount `
 -ResourceGroupName $ResourseGroupName `
 -Name $StorageAccountName `
 -Location $Location `
 -Kind $Kind `
 -SkuName $SkuName

