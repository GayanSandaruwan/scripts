#Set-ExecutionPolicy unrestricted
Function Get-Folder($initialDirectory)

{
    [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms")|Out-Null

    $foldername = New-Object System.Windows.Forms.FolderBrowserDialog
    $foldername.Description = "Select a folder"
    $foldername.rootfolder = "MyComputer"

    if($foldername.ShowDialog() -eq "OK")
    {
        $folder += $foldername.SelectedPath
    }
    return $folder
}

$a = Get-Folder

#$a = "E:\CiperLabs\fiver\scripts\file_names to excel\Samples"
$b = -join($a,"\*");

$excel = New-Object -ComObject excel.application
$excel.visible = $True
$workbook = $excel.Workbooks.Add();
$uregwksht= $workbook.Worksheets.Item(1)
$uregwksht.Name = 'sheet 1'

$row = 1;
$uregwksht.Cells.Item($row,1)= "Agency";
$uregwksht.Cells.Item($row,2)= "Amount Paid";
$row = 2;
Get-ChildItem $b -Include *.pdf,*.xlsx ,*.png, *.docx, *.csv  | 
Foreach-Object {
	$splitted_name = $_.BaseName.split("$");
    $name = $splitted_name[0];
    $price = $splitted_name[1].split("-")[0];

    $uregwksht.Cells.Item($row,1)= $name;
    $uregwksht.Cells.Item($row,2)= $price;
    
    $row +=1;

}

$outputpath = -join($a,"-price-list.xlsx");
$workbook.SaveAs($outputpath)
$excel.Quit()

#pause
