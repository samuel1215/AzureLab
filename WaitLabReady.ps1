Param(
    [parameter(Mandatory=$true)]
    [string]
    $LabCSVFilePath
)

$Servers = Import-Csv $LabCSVFilePath
foreach ($Server in $Servers)
{
    do
    {
        Sleep 30
    }
    while((Get-AzureVM -ServiceName $Server.ServiceName -Name $Server.Name).Status -ne "ReadyRole")
}