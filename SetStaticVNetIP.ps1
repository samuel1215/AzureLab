Get-AzureVM -ServiceName studyrootdc | Set-AzureStaticVNetIP -IPAddress '192.168.0.132' | Update-AzureVM
Get-AzureVM -ServiceName qmmfit | Set-AzureStaticVNetIP -IPAddress '192.168.0.133' | Update-AzureVM
Get-AzureVM -ServiceName studye14dc2 | Set-AzureStaticVNetIP -IPAddress '192.168.0.134' | Update-AzureVM
Get-AzureVM -ServiceName sapsan2k12 | Set-AzureStaticVNetIP -IPAddress '192.168.0.135' | Update-AzureVM
Get-AzureVM -ServiceName studynewr2dc2 | Set-AzureStaticVNetIP -IPAddress '192.168.0.136' | Update-AzureVM
Get-AzureVM -ServiceName curiosity-win2012r2dc | Set-AzureStaticVNetIP -IPAddress '192.168.0.137' | Update-AzureVM
Get-AzureVM -ServiceName studyjuste14dc | Set-AzureStaticVNetIP -IPAddress '192.168.0.138' | Update-AzureVM