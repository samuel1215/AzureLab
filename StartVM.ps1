Param(
    [parameter(Mandatory=$true)]
    [string]
    $ServiceName,
    [parameter(Mandatory=$true)]
    [string]
    $Name,
    [parameter(Mandatory=$false)]
    [string]
    $IPAddress
)

if($IPAddress)
{
    Get-AzureVM -ServiceName $ServiceName -Name $Name | Set-AzureStaticVNetIP -IPAddress $IPAddress | Update-AzureVM
}

$vm = Start-AzureVM -ServiceName $ServiceName -Name $Name

$vm.OperationId