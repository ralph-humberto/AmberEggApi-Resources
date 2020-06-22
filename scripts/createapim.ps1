function ArrayToHash($a)
{
    $hash = @{}
    $a | foreach { $hash[$_] = "" }
    return $hash
}

$subscription = $args[0]
$resourceGroupName = $args[1]
$resourceVnetName = $args[2]
$resourceSubnetName = $args[3]
$apiManagementName = $args[4]
$apiManagementPublisherEmail = $args[5]
$apiManagementPublisherName = $args[6]
$resourceTags = ArrayToHash($args[7].Split(" "))

$apiManagementCheck = Get-AzApiManagement -ResourceGroupName $resourceGroupName -Name $apiManagementName

if($apiManagementCheck.Length() -lt 1) {
    write-host "Creating api management $apiManagementName"
    $virtualNetwork = New-AzApiManagementVirtualNetwork -SubnetResourceId "/subscriptions/$subscription/resourceGroups/$resourceGroupName/providers/Microsoft.Network/virtualNetworks/$resourceVnetName/subnets/api-management-subnet"
    New-AzApiManagement -ResourceGroupName $resourceGroupName -Location "East US" -Name $apiManagementName -Organization $apiManagementName -AdminEmail $apiManagementPublisherEmail -Sku "Developer" -VpnType "External" -VirtualNetwork $virtualNetwork
}else {
	write-host "$apiManagementName:already exists"
}



