$logfile="E:\CiperLabs\fiver\exe_runner\a.txt"
$timeout=5
$exe_dir=".\"
Get-ChildItem $exe_dir -Filter *.exe | 
Foreach-Object {
    $fileName = $_.FullName
    echo $fileName
    $logFileStartSize=(Get-Item $logfile).length
    $app = Start-Process $fileName -passthru
    echo $app
    Start-Sleep -s $timeout
    while((Get-Item $logfile).length -gt $logFileStartSize) {
        $logFileStartSize=(Get-Item $logfile).length
	    Start-Sleep -s $timeout
    }
    $app.Kill()
}