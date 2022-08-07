#Created by NatiZekri
#Add Bluk Adresses to your Fortigate devices
#has been tested on fortigate version 7.2
$SSHsession=New-SSHSession -ComputerName "192.168.1.99" -Credential (Get-Credential) -AcceptKey 
$SSHStream = New-SSHShellStream -Index $SSHsession.SessionId
$cmd="
 config firewall address
 edit "
 $cmd3=" set subnet"
 $cmd5="
next
end"


import-csv -Path C:\aws-us-east.csv -Header IpPrefix,name | Foreach-Object{

   $cmd2=$_.name
   $cmd4=$_.IpPrefix
   Invoke-SSHStreamShellCommand -ShellStream $SSHStream -Command $cmd" "$cmd2" 
   "$cmd3" "$cmd4" "$cmd5  
}
