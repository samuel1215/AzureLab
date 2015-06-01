Param(
    [parameter(Mandatory=$true)]
    [string]
    $LabCSVFilePath
)

$Servers = Import-Csv $LabCSVFilePath

for($i=$Servers.length-1;$i -ge 0;$i--)
{
    Get-AzureVM -ServiceName $Servers[$i].ServiceName -Name $Servers[$i].Name | Stop-AzureVM -Force
}