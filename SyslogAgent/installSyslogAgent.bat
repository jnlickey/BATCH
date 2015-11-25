:: Created to install and setup SyslogAgent on Windows 7
:: Created by: nlickey 10/27/2015
c:
cd /
mkdir Win_Syslog
v:
cd V:\win_syslogagent\
copy V:\win_syslogagent\Syslog*.exe c:\Win_Syslog /Y
c:
cd c:\Win_Syslog
start /wait SyslogAgent.exe -install <SYSLOGSERVER_IP_ADDRESS>
net start "Syslog Agent"
exit
