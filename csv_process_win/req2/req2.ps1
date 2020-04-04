#Set-ExecutionPolicy unrestricted
Add-Type -AssemblyName System.Windows.Forms
$FileBrowser = New-Object System.Windows.Forms.OpenFileDialog 
$null = $FileBrowser.ShowDialog()
##
$FileBrowser.FileName

$filename = "E:\CiperLabs\fiver\csv_process_win\req2\Requirement2_inputfile.csv"
$targetfile = "$((Get-Item $filename).DirectoryName)\$((Get-Item $filename).BaseName)-out.csv"
$serverlist = import-csv $filename –header FQDN_NAME



ForEach ($server in $serverlist){

    $fqdn = $($server.FQDN_NAME)

    if($fqdn.Equals("FQDN NAME")){
        continue;
    }
    else{

    #$ip = (nslookup $fqdn)[4]
    $pingout = (ping $fqdn)[1]


    
    $pingoutip=" "
    $pingouthost=" "
    Try{
        $pingoutarr = $pingout.Split("[");
        $pingoutip = $pingoutarr[1].Split("]")[0];
        $pingouthost = $pingoutarr[0].Split(" ")[1];
    }
    Catch{}
        $fqdnarr = $fqdn.Split(".");


        New-Object -TypeName PSCustomObject -Property @{
            'FQDN NAME' = $fqdn
            'Hostname'= $fqdnarr[0];
            'Alias FQDN Name'= $pingouthost
            'Alias Name'= $pingouthost.Split(".")[0]
            'IpAddress' = $pingoutip
        } | Export-Csv -Path $targetfile -NoTypeInformation -Append
          
    }
     
}