Param(
    [parameter(Mandatory=$true)]
    [string]
    $ServiceName,
    [parameter(Mandatory=$true)]
    [string]
    $Name
)
$op = Start-AzureVM -ServiceName $ServiceName -Name $Name

$toString = $op.OperationId + ":" + $op.OperationStatus + ":" + $Name
$toString