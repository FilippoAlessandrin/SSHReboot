#NoEnv 
; #Warn  ; 
SendMode Input  
SetWorkingDir %A_ScriptDir%  

Loop, Read, %A_ScriptDir%\sshIP.txt   
{
    ArrayCount += 1  
	word_array := StrSplit(A_LoopReadLine, ",") 
    ArrayIP%ArrayCount% := word_array[1]
	ArrayPassword%ArrayCount% := word_array[2]
}


Run, C:\WINDOWS\system32\cmd.exe
sleep, 1000
Loop %ArrayCount%
{
	WinActivate, C:\WINDOWS\system32\cmd.exe
    iprasp := ArrayIP%A_Index%
	password := ArrayPassword%A_Index%
	sleep, 500
	Send ssh -l pi %iprasp% {Enter}
	sleep, 1000
	Send %password%
	Send {Enter}
	sleep, 1000
	Send sudo reboot
	Send {Enter}

	sleep, 2000
	
}



