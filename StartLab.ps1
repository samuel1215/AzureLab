Param(
    [parameter(Mandatory=$true)]
    [string]
    $LabCSVFilePath
)

$Servers = Import-Csv $LabCSVFilePath
foreach ($Server in $Servers)
{
    .\StartVM.ps1 -ServiceName $Server.ServiceName -Name $Server.Name -IPAddress $Server.IPAddress
    if($Server.NeedToWaitForReady -eq "y")
    {
        do
        {
            Sleep 30
            "Sleep 30 sec" | Out-Default
        }
        while((Get-AzureVM -ServiceName $Server.ServiceName -Name $Server.Name).Status -ne "ReadyRole")
    }
}