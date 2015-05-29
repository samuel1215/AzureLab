Param(
    [parameter(Mandatory=$true)]
    [string]
    $LabCSVFilePath
)

$Servers = Import-Csv $LabCSVFilePath
foreach ($Server in $Servers)
{
    Get-AzureVM -ServiceName $Server.ServiceName -Name $Server.Name | Stop-AzureVM -Force
}