function Get-Wllaan-Keeys 
{


[CmdletBinding()]
Param ()

    $wlans = netsh wlan show profiles | Select-String -Pattern "All User Profile" | Foreach-Object {$_.ToString()}
    $exportdata = $wlans | Foreach-Object {$_.Replace("    All User Profile     : ",$null)}
    $exportdata | ForEach-Object {netsh wlan show profiles name="$_" key=clear}
   
}


