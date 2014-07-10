$sqlServer = "database server"
$sqlUser = "sql user"
$sqlPassword = "password"
$sqlDatabase

$scriptsPath = ".\Scripts"
$tempPath = ".\Temp"
$archivePath = ".\Archive"
$yesterday = (Get-Date).AddDays(-1).ToString('MM-dd-yyyy')

New-Item -Name "$archivePath\$yesterday" -ItemType directory
Move-Item "$tempPath\*.csv" "$archivePath\$yesterday"
Remove-Item "$tempPath\*"

$scripts = Get-ChildItem $scriptsPath *.sql | Where-Object {!($_.PSIsContainer)} | Sort-Object $_.name
foreach ($script in $scripts) {
    $shortName = $script -replace ".sql"
    Write-Host "$scriptsPath\$script"
    Write-Host $shortName
    sqlcmd -s ',' -W -S $sqlServer -U $sqlUser -P $sqlPassword -u -d $sqlDatabase -i "$scriptsPath\$script" -o "$tempPath\$shortName.csv"
    &'C:\Program Files\7-zip\7z.exe' a "$tempPath\report.zip" "$tempPath\$shortName.csv"
}

$smtp = New-Object System.Net.Mail.SmtpClient("email server",587)
$smtp.EnableSsl = $true
$smtp.Credentials = New-Object System.Net.NetworkCredential("username","password)
$message = New-Object System.Net.Mail.MailMessage("from email","coma seperated list of to email addresses")
$message.Subject = "Daily Stats For " + (get-date).ToShortDateString()
$message.Body = "Here are the numbers:"
$zipAttachment = New-Object System.Net.Mail.Attachment("$tempPath\report.zip")
$message.Attachments.Add($zipAttachment)
$smtp.Send($message)
