
$rg = @{
    Name = "az-104selflab1"
    Location = "ukwest"
}

#create subnets for dev vnet - dev1 and dev 2
$devSubnet1 = New-AzVirtualNetworkSubnetConfig -Name "dev1" -AddressPrefix "10.0.1.0/24"
$devSubnet2 = New-AzVirtualNetworkSubnetConfig -Name "dev2" -AddressPrefix "10.0.2.0/24"

#create subnet for test vnet - test1
$testSubnet1 = New-AzVirtualNetworkSubnetConfig -Name "test1" -AddressPrefix "10.1.1.0/24"

$vnet1 = @{
    Name = "dev-vnet"
    AddressPrefix = "10.0.0.0/16"
    ResourceGroupName = $rg.Name
    Location = $rg.Location
    Subnet  = @($devSubnet1, $devSubnet2)
}

$vnet2 = @{
    Name = "test-vnet"
    AddressPrefix = "10.1.0.0/16"
    ResourceGroupName = $rg.Name
    Location = $rg.Location
    Subnet  = $testSubnet1
}

Write-Host "/// Creating resource group $($rg.Name)... "
#create a resource group that will contain the virtual networks
New-AzResourceGroup @rg
Write-Host "/// Resource group created"
Write-Host ""

Write-Host "/// Creating Dev vNet"
#create dev vnet
New-AzVirtualNetwork @vnet1
Write-Host "/// Dev vnet created"
Write-Host ""

Write-Host "/// Creating test vNet"
#create tes vnet
New-AzVirtualNetwork @vnet2
Write-Host "/// test vnet created"