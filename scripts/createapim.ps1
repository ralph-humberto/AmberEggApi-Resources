$subscription = $args[0]
$resourceGroupName = $args[1]
$resourceVnetName = $args[2]
$resourceSubnetName = $args[3]
$apiManagementName = $args[4]
$apiManagementPublisherEmail = $args[5]
$apiManagementPublisherName = $args[6]
$resourceTags = $args[7].Split(" ")

write-host "$subscription"
write-host "$resourceGroupName"
write-host "$resourceVnetName"
write-host "$resourceSubnetName"
write-host "$apiManagementName"
write-host "$apiManagementPublisherEmail"
write-host "$apiManagementPublisherName"
write-host "$resourceTags"

$virtualNetwork = New-AzApiManagementVirtualNetwork -SubnetResourceId "/subscriptions/$subscription/resourceGroups/$resourceGroupName/providers/Microsoft.Network/virtualNetworks/$resourceVnetName/subnets/api-management-subnet"
New-AzApiManagement -ResourceGroupName $resourceGroupName -Location "East US" -Name "$apiManagementName" -Organization "$apiManagementName" -AdminEmail "$apiManagementPublisherEmail" -Sku "Developer" -VpnType "External" -Tag "$resourceTags" -VirtualNetwork $virtualNetwork
