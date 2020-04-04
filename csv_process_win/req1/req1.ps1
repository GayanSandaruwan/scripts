Add-Type -AssemblyName System.Windows.Forms
$FileBrowser = New-Object System.Windows.Forms.OpenFileDialog
$null = $FileBrowser.ShowDialog()
#
#$FileBrowser.FileName

$filename = $FileBrowser.FileName             #"E:\CiperLabs\fiver\csv_process_win\Requirement1_inputfile.csv"
$targetfile = "$((Get-Item $filename).DirectoryName)\$((Get-Item $filename).BaseName)-out.txt"
$serverlist = import-csv $filename –header FQDN_NAME, HOSTNAME, ALIAS_FQDN_NAME, ALIAS_NAME

ForEach ($server in $serverlist){

    $fqdn = $($server.FQDN_NAME)
    $hostname = $($server.HOSTNAME)
    $aliasfqdn = $($server.ALIAS_FQDN_NAME)
    $aliasname = $($server.ALIAS_NAME)
    if($fqdn.Equals("FQDN NAME")){
        continue;
    }
    else{
        Write-host $fqdn $hostname $aliasfqdn $aliasname
        Add-Content $targetfile "curl -u test:test -k https://$($fqdn):8089/services/properties/server/general -d serverName=$($aliasname)"
        Add-Content $targetfile "curl -u test:test -k https://$($fqdn):8089/services/properties/inputs/default -d serverName=$($aliasname)"
        Add-Content $targetfile "curl -u test:test -k https://$($fqdn):8089/services/server/control/restart -X POST"
    }
     
    Add-Content $targetfile ""
}
#Add-Content c:\scripts\test.txt "The End"

#curl -u test:test -k https://columnA1_Value:8089/services/properties/server/general -d serverName=columnD1_value
#curl -u test:test -k https://columnA1_Value:8089/services/properties/inputs/default -d serverName=columnD1_value
#curl -u test:test -k https://columnA1_Value:8089/services/server/control/restart -X POST

