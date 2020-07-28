$data = Get-Content $args[0] -raw -Encoding oem

if([byte]$data[$data.length-1] -eq 26){
    Set-Content $args[0] -Value $data.Substring(0,$data.length-3) -Encoding oem -NoNewline    
    Write-Output "OK!"
}