Param(
    [parameter(Mandatory=$true)]
    [string]
    $LabCSVFilePath
)

$Servers = Import-Csv $LabCSVFilePath
$StartedVM_Begin = 0
$StartedVM_Current = 0
foreach ($Server in $Servers)
{
    .\StartVM.ps1 -ServiceName $Server.ServiceName -Name $Server.Name -IPAddress $Server.IPAddress
    if($Server.WaitForPastReady -eq "y")
    {
        for($i=$StartedVM_Begin;$i -le $StartedVM_Current;$i++)
        {
            do
            {
                Sleep 15
            }
            while((Get-AzureVM -ServiceName $Servers[$i].ServiceName -Name $Servers[$i].Name).Status -ne "ReadyRole")
         }
         $StartedVM_Begin = $StartedVM_Current + 1
    }
    $StartedVM_Current++
}