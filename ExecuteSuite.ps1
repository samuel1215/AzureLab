Param(
    [parameter(Mandatory=$true)]
    [string]
    $Uri
)


[System.Net.ServicePointManager]::MaxServicePointIdleTime = 30*60*1000
$request = [System.Net.HttpWebRequest][System.Net.WebRequest]::Create($Uri)
$request.Method = "Get"
$request.KeepAlive = $true
$request.Timeout = 30*60*1000
$request.ReadWriteTimeout = 30*60*1000
$request.ProtocolVersion = [System.Net.HttpVersion]::Version11
$request.ServicePoint.ConnectionLeaseTimeout = 30*60*1000
$request.ServicePoint.MaxIdleTime = 30*60*1000
$request.ServicePoint.SetTcpKeepAlive($true,60*1000,30*1000)
try
{
    $rp = [System.Net.HttpWebResponse]$request.GetResponse()
    $stream = $rp.GetResponseStream()
    $reader = New-Object System.IO.StreamReader($stream)
    $ret = $reader.ReadToEnd()
    $stream.Close()
    $reader.Close()
    $rp.Close()
}
finally
{
    if ($null -ne $stream)
    {
        $stream.Close()
    }
    if ($null -ne $reader)
    {
        $stream.Close()
    }
    if ($null -ne $rp)
    {
        $stream.Close()
    }
}
$ret
