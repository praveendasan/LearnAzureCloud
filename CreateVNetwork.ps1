#region ResourceGroup
$rg = 'VN-ResourceGroup'
$location = 'Southeast Asia'

#region VNET Name and Address space
$VNETName = 'SL-7320-VNET-Pshell'
$VNETAddressSpace = '10.0.0.0/22'
#endregion

#region Subnet Names and Address space
$subnetAName = 'SL-Web'
$subnetAAddressPrefix = '10.0.0.0/24'
$subnetBName = 'SL-App'
$subnetBAddressPrefix = '10.0.1.0/24'
$subnetCName = 'SL-Data'
$subnetCAddressPrefix = '10.0.2.0/24'
#endregion

#region
$subnets = New-AzureRmVirtualNetworkSubnetConfig -Name $subnetAName -AddressPrefix $subnetAAddressPrefix

#Create VNET and include subnet configuration
$vnet = New-AzureRmVirtualNetwork -Name $VNETName -ResourceGroupName $rg -Location $location -AddressPrefix $VNETAddressSpace -Subnet $subnets
#endregion

#Add Additional subnets
Add-AzureRmVirtualNetworkSubnetConfig -VirtualNetwork $vnet -Name $subnetBName -AddressPrefix $subnetBAddressPrefix
Add-AzureRmVirtualNetworkSubnetConfig -VirtualNetwork $vnet -Name $subnetCName -AddressPrefix $subnetCAddressPrefix

#Save the additional subnet configurations
Set-AzureRmVirtualNetwork -VirtualNetwork $vnet
#endregion