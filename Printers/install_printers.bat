REM # rundll32 printui.dll,PrintUIEntry /if /b "lp217 (Ricoh Aficio SP 4310N)" /f "V:\Ricoh_Printer_Install_Lp217\Ricoh_Drivers\z53560Lf\disk1\OEMSETUP.INF" /r "\\spooler.example.com\lp217" /m "RICOH Aficio SP 4310N PCL 6"
REM #
REM #
net use v: \\windows_soft\win_installs /u:someuser password
SET ROOM=%COMPUTERNAME:~3,3%

REM # jump to :CASE_CSE217, :CASE_CSE103, etc.
2>NUL CALL :CASE_%ROOM%
REM # if label doesn't exist
IF ERRORLEVEL 1 CALL :DEFAULT_CASE

ECHO Done.
EXIT /B

:CASE_103
IP_ADDR="x.y.103.111"
INF_PATH="V:\Ricoh_Printer_Install_Lp103\Ricoh_Drivers\z67562L17\64bit\OEMSETUP.INF"
MFG_DRIVER_NAME="PCL6 Driver for Universal Print"
TU_PRINTER_NAME="EU103_Ricoh_Aficio_SP_4310N"
GOTO CASE_INSTALL

:CASE_201
IP_ADDR="x.y.201.111"
INF_PATH="V:\Ricoh_Printer_Install_Lp217\Ricoh_Drivers\z67562L17\64bit\OEMSETUP.INF"
MFG_DRIVER_NAME="PCL6 Driver for Universal Print"
TU_PRINTER_NAME="EU201_Ricoh_Aficio_SP_4310N"
GOTO CASE_INSTALL

:CASE_217
IP_ADDR="x.y.217.111"
INF_PATH="V:\Ricoh_Printer_Install_Lp217\Ricoh_Drivers\z67562L17\64bit\OEMSETUP.INF"
MFG_DRIVER_NAME="PCL6 Driver for Universal Print"
TU_PRINTER_NAME="EU217_Ricoh_Aficio_SP_4310N"
GOTO CASE_INSTALL

:CASE_218
IP_ADDR="x.y.218.111"
INF_PATH="V:\Ricoh_Printer_Install_Lp217\Ricoh_Drivers\z67562L17\64bit\OEMSETUP.INF"
MFG_DRIVER_NAME="PCL6 Driver for Universal Print"
TU_PRINTER_NAME="EU218_Ricoh_Aficio_SP_4310N"
GOTO CASE_INSTALL

:CASE_224
IP_ADDR="x.y.224.111"
INF_PATH="V:\HP_Printer_Install_Lp224\HP_Drivers\hpoa1so.inf"
MFG_DRIVER_NAME="HP LaserJet 4100 Series PCL6"
TU_PRINTER_NAME="EU224_HP_4100"
GOTO CASE_INSTALL

:CASE_VER
IP_ADDR="x.y.217.111"
INF_PATH="V:\Ricoh_Printer_Install_Lp217\Ricoh_Drivers\z67562L17\64bit\OEMSETUP.INF"
MFG_DRIVER_NAME="PCL6 Driver for Universal Print"
TU_PRINTER_NAME="EU217_Ricoh_Aficio_SP_4310N"
GOTO CASE_INSTALL

:CASE_LM1
IP_ADDR="x.y.217.111"
INF_PATH="V:\Ricoh_Printer_Install_Lp217\Ricoh_Drivers\z67562L17\64bit\OEMSETUP.INF"
MFG_DRIVER_NAME="PCL6 Driver for Universal Print"
TU_PRINTER_NAME="EU217_Ricoh_Aficio_SP_4310N"
GOTO CASE_INSTALL

:CASE_INSTALL
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Ports" /v "\\spooler.example.com\lp%ROOM%" /t reg_sz 
net stop spooler 
net start spooler
cscript %WINDIR%\System32\Printing_Admin_Scripts\en-US\Prnport.vbs -a -r IP_%IP_ADDR% -h %IP_ADDR% -o raw -n 9100
rundll32 printui.dll,PrintUIEntry /ia /m %MFG_DRIVER_NAME% /f %INF_PATH%
rundll32 printui.dll,PrintUIEntry /if /b %TU_PRINTER_NAME% /f %INF_PATH% /r "%IP_ADDR%" /m %MFG_DRIVER_NAME%
rundll32 PRINTUI.DLL,PrintUIEntry /ga /y /n %TU_PRINTER_NAME%
GOTO END_CASE

:DEFAULT_CASE
ECHO Unknown Room "%ROOM%"
PAUSE
GOTO END_CASE

:END_CASE
VER > NUL
GOTO :EOF
