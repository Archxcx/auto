#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
CoordMode,Pixel,Screen
CoordMode,Mouse,Client
DetectHiddenWindows,On
SetBatchLines, -1
SetControlDelay, -1
#SingleInstance, Off

Gui,add,dropdownlist,gpack vpack x5 w225 , SSP|Ghost Pack|Treasure

Gui,add,button,x5 y30 w100 h25 gsetpack vsetpack,set item
gui,add,edit, x+5 vpackedit

Gui,add,button,x5 y+5 w100 h25 gsetwindow,set window
gui,add,edit, x+5 vpackpid

Gui,add,button,x5 y+5 w100 h25 gsetwrench ,set wrench
gui,add,edit, x+5 vwrenchedit

Gui,add,button,x5 y+5 w100 h25 gsetcharacter ,set character
gui,add,edit, x+5 vcharacteredit

Gui,add,button,x5 y+5 w225 h25 gbuyghost ,Start

Gui,add,text, y+5, Average: 
gui,add,text, x+5 w150 vaverage, 0

gui,show,

iniread, count, recon.ini, recon, count

iniread,packx,recon.ini,recon,packx
iniread,packy,recon.ini,recon,packy
iniread,packpid,recon.ini,recon,packpid
iniread,wrenchx,recon.ini,recon,wrenchx
iniread,wrenchy,recon.ini,recon,wrenchy
iniread,characterx,recon.ini,recon,characterx
iniread,charactery,recon.ini,recon,charactery

GuiControl,,packpid,%packPID%
GuiControl,,packEdit,%packX%`,%packy%
GuiControl,,wrenchedit,%wrenchx%`,%wrenchy%
GuiControl,,characteredit,%characterx%`,%charactery%

if (count="ERROR"){
iniwrite, 1, recon.ini,recon,count	
global count:=1
}
return

pack:
    Gui, Submit, Nohide
    If (pack = "SSP"){
        global pack:="SSP"
	guicontrol,, setpack, Set SSP
    }If (pack = "Ghost Pack"){
        global pack:="ghost"
	guicontrol,, setpack, Set Ghost
    }If (pack = "Treasure"){
		pack:="treasure"
	guicontrol,, setpack, Set Treasure
}
return

;~ H::
;~ WingetPos,WinX,WinY,WinD,WinH,ahk_pid %packpid%
;~ X1:=WinX
;~ Y1:=WinY
;~ X2:=WinD
;~ Y2:=WinH
;~ imagesearch,x,y,%x1%,%y1%,%x2%,%y2%, addmacine.png
;~ if (errorlevel=0){
	;~ tooltip, found
;~ }
;~ else if (Errorlevel=1){
	;~ tooltip, nope
;~ }
;~ else if (Errorlevel=2){
	;~ tooltip, pic error
;~ }
;~ return

;~ WingetPos,WinX,WinY,WinD,WinH,ahk_pid %packpid%
;~ X1:=WinX
;~ Y1:=WinY
;~ X2:=WinD
;~ Y2:=WinH
;~ imagesearch,x,y,%x1%,%y1%,%x2%,%y2%,gemtemp.png
;~ if  (errorlevel=0){
;~ controlclick,,ahk_pid %packpid%,,,,X937 Y53 NA
;~ msgbox, found
;~ }
;~ return
;~ WingetPos,WinX,WinY,WinD,WinH,ahk_pid %packpid%
;~ X1:=WinX
;~ Y1:=WinY
;~ X2:=Winx+1024
;~ Y2:=Winy+768
;~ mousemove, %x1%,%y1%
;~ sleep, 100
;~ mousemove, %x2%,%y2%
;~ goto, buy
									;~ Controlsend,,{Esc}{Esc},ahk_pid %packpid%
									;~ sleep, 1000
									;~ Controlsend,,{D DOWN},ahk_pid %packpid%
									;~ sleep, 146
									;~ Controlsend,,{D UP},ahk_pid %packpid%
;~ imagesearch,x,y,%x1%,%y1%,%x2%,%y2%,gem.png
;~ if (errorlevel=0){
;~ tooltip, found
;~ mousemove, %x%, %y%
;~ }
;~ else if (Errorlevel=1){
	;~ tooltip,not found
;~ }
;~ else if (Errorlevel=2){
;~ tooltip, problem with image	
;~ }
return

;~ D::
    ;~ time := A_TickCount
	;~ KeyWait, D
    ;~ var := A_TickCount - time
	;~ MsgBox, The D key has been held down for %var%ms
;~ return

;~ H:
;~ loop{
;~ Controlsend,,{Enter}{Blind},ahk_pid %packpid%
;~ sleep, 3000
;~ Controlsend,,{W Down}{Blind},ahk_pid %packpid%
;~ sleep, 400
;~ Controlsend,,{W Up}{Blind},ahk_pid %packpid%
;~ sleep, 300
;~ Controlsend,,{D Down}{Blind},ahk_pid %packpid%
;~ sleep, 450
;~ Controlsend,,{D Up}{Blind},ahk_pid %packpid%
;~ sleep, 300
;~ Controlsend,,{W Down}{Blind},ahk_pid %packpid%
;~ sleep, 400
;~ Controlsend,,{W Up}{Blind},ahk_pid %packpid%
;~ sleep, 300
;~ Controlsend,,{D Down}{Blind},ahk_pid %packpid%
;~ sleep, 550
;~ Controlsend,,{D Up}{Blind},ahk_pid %packpid%
;~ sleep, 66000
;~ }
;~ return

buy:
t:=!t
;~ settimer,H,66000
if t{
WinHide,ahk_pid %packpid%
}
else
	WinShow, ahk_pid %packpid%
return
;~ ;314 \ 12
;~ J::
;~ WingetPos,WinX,WinY,WinD,WinH,ahk_pid %packpid%
;~ X1:=WinX
;~ Y1:=WinY
;~ X2:=WinX+1024
;~ Y2:=WinY+800
;~ msgbox, %x1%,%y1%,%x2%,%y2%
;~ loop{
;~ imagesearch,x,y,%x1%,%y1%,%x2%,%y2%,ok.png
;~ if (errorlevel=0){
	;~ y-=30
;~ tooltip, found, %x%,%y%
;~ mousemove, %x%,%y%
;~ }
;~ else if (errorlevel=1){
;~ tooltip, not found	
;~ }
;~ }
;~ K::ExitApp
;~ return
buyghost:
Counter:=0
Total:=0
count1:=count-1
counter2:=1
WingetPos,WinX,WinY,WinD,WinH,ahk_pid %packpid%
X1:=WinX
Y1:=WinY
X2:=WinD
Y2:=WinH+80
loop{
loop %count1%{
iniread,number,recon.ini,counter,|%counter2%|
total+=number
counter2++
}
avg:=Ceil(Total/count1)
guicontrol,,average,%avg% | Total: %total% | Count: %count1%
	imagesearch,x,y,%x1%,%y1%,%x2%,%y2%,blocktemp.png
	if (Errorlevel=0){
		sleep, 500
		controlclick,,ahk_pid %packpid%,,,5,X981 Y388  NA
		sleep, 500
			loop{
			imagesearch,x,y,%x1%,%y1%,%x2%,%y2%,*40 itempack.png
				if (Errorlevel=0){
					controlclick,,ahk_pid %packpid%,,,,X%X% Y%Y% NA
							sleep, 1000
							loop{
							imagesearch,x,y,%x1%,%y1%,%x2%,%y2%,*40 ssp.png
							if (Errorlevel=0){
							sleep, 300
							loop,20{
							controlclick,,ahk_pid %packpid%,,WheelDown,1,X206 Y595 NA
							sleep, 1
						}
						;~ tooltip, ya
							}else if (Errorlevel=1){
								imagesearch,x,y,%x1%,%y1%,%x2%,%y2%,*40 ghost.png
							if (Errorlevel=0){
								break, 3
							}
						}
					}
				}
			}
		}
	}
									sleep, 2000
									loop{
									imagesearch,x,y,%x1%,%y1%,%x2%,%y2%,*40 ghost.png
									if (Errorlevel=0){
										sleep, 100
										
										controlclick,,ahk_pid %packpid%,,,,X%X% Y%Y% NA
										coordmode, tooltip, screen
										WinGetPos,X,Y,,,ahk_pid %packpid%
										counter++
										tooltip, %counter%,%x%,%y%
											loop{
											imagesearch,x,y,%x1%,%y1%,%x2%,%y2%,*40 price.png
											if (Errorlevel=0){
												controlclick,,ahk_pid %packpid%,,,,X%X% Y%Y% NA
													loop{
													imagesearch,x,y,%x1%,%y1%,%x2%,%y2%,max.png
													if (Errorlevel=0){
													controlclick,,ahk_pid %packpid%,,,,X%X% Y%Y% NA
													sleep, 100
													break 2
}
														else if (Errorlevel=1){
														imagesearch,x,y,%x1%,%y1%,%x2%,%y2%,*80 continue.png
														if (Errorlevel=0){
														iniwrite, %counter%,recon.ini,counter,|%count%|
														count++
														iniwrite, %count%, recon.ini, recon, count
														
														controlclick,,ahk_pid %packpid%,,,,X%X% Y%Y% NA
														sleep, 100
														loop{
														imagesearch,x,y,%x1%,%y1%,%x2%,%y2%,gemtemp.png
														if  (errorlevel=0){
															sleep, 500
														controlclick,,ahk_pid %packpid%,,,,X937 Y53 NA
														sleep, 1000
														controlclick,,ahk_pid %packpid%,,,,X%packX% Y%packY% NA
														sleep, 100
														loop{
														imagesearch,x,y,%x1%,%y1%,%x2%,%y2%,*30 drop.png
														if  (errorlevel=0){
														y-=10
														controlclick,,ahk_pid %packpid%,,,5,X%X% Y%Y% NA
														;~ mousemove, %x%,%y%
														break
													}
													;~ else
														;~ tooltip, not found drop
												}
														sleep,500
														SetKeyDelay,50
														loop{
														imagesearch,x,y,%x1%,%y1%,%x2%,%y2%,ok.png
														if  (errorlevel=0){
															sleep, 300
														Controlsend,,{Backspace}{Backspace}{Backspace}5, ahk_pid %packpid%
														sleep, 50
														loop{
														imagesearch,x,y,%x1%,%y1%,%x2%,%y2%,ok.png
														if  (errorlevel=0){
														x+=231
														sleep, 50
														controlclick,,ahk_pid %packpid%,,,5,X%X% Y%y% NA
														;~ mousemove, %x%,%y%
														break, 2
													}
													;~ else
														;~ tooltip, not found ok
												}
											}
										}
														sleep, 1000
														controlclick,,ahk_pid %packpid%,,,,X%characterx% Y%charactery% NA
														sleep, 100
														loop{
														imagesearch,x,y,%x1%,%y1%,%x2%,%y2%,*30 drop.png
														if  (errorlevel=0){
														y-=10
														controlclick,,ahk_pid %packpid%,,,5,X%X% Y%Y% NA
														;~ mousemove, %x%,%y%
														sleep, 2000
														break
													}
												}
														loop{
														imagesearch,x,y,%x1%,%y1%,%x2%,%y2%,ok.png
														if  (errorlevel=0){
														x+=231
														controlclick,,ahk_pid %packpid%,,,5,X%X% Y%y% NA
														sleep, 1000
														imagesearch,x,y,%x1%,%y1%,%x2%,%y2%,ok.png
														if  (errorlevel=1){
														goto, end1
														
}
}
}
}
}
}
}
}
}
}
}
}
return

buys:
WingetPos,WinX,WinY,WinD,WinH,ahk_pid %packpid%
global X1:=WinX
global Y1:=WinY
global X2:=WinD
global Y2:=WinH
;~ msgbox, %x1% %y1% %x2% %y2%
loop{
imagesearch,x,y,%x1%,%y1%,%x2%,%y2%,gem.png
if (Errorlevel=0){
	;~ tooltip, found
controlclick,,ahk_pid %packpid%,,,5,X%X% Y%Y%
;~ mousemove, %x%,%y%
;~ click
sleep, 100
if (pack="ssp"||"ghost"){
loop{
	imagesearch,x,y,%x1%,%y1%,%x2%,%y2%,*40 itempack.png
	if (Errorlevel=0){
	controlclick,,ahk_pid %packpid%,,,,X%X% Y%Y% NA
	;~ mousemove, %x%,%y%
;~ click
break
}
}
}

if (pack="treasure"){
loop{
	imagesearch,x,y,%x1%,%y1%,%x2%,%y2%,weather.png
	if (Errorlevel=0){
	controlclick,,ahk_pid %packpid%,,,,X%X% Y%Y% NA
	;~ mousemove, %x%,%y%
;~ click
break
}
}
}
	sleep, 100
if (pack="treasure"||"ghost"){
		sleep, 500
		mousemove, 206, 595
send, {wheeldown 1000}
sleep, 1000
}

if (pack="treasure"){
	loop{
		imagesearch,x,y,%x1%,%y1%,%x2%,%y2%,*40 treasure.png
		if (Errorlevel=0){
		controlclick,,ahk_pid %packpid%,,,,X%X% Y%Y% NA
		break
		;~ mousemove, %x%,%y%
;~ click
}
}

if (pack="ghost"){
	loop{
		imagesearch,x,y,%x1%,%y1%,%x2%,%y2%,*40 ghost.png
		if (Errorlevel=0){
		controlclick,,ahk_pid %packpid%,,,,X%X% Y%Y% NA
		break
		;~ mousemove, %x%,%y%
;~ click
}
}

if (pack="ssp"){
	loop{
		imagesearch,x,y,%x1%,%y1%,%x2%,%y2%,ssp.png
		if (Errorlevel=0){
		controlclick,,ahk_pid %packpid%,,,,X%X% Y%Y% NA
		;~ mousemove, %x%,%y%
;~ click
break
}
}
}
			loop{
			imagesearch,x,y,%x1%,%y1%,%x2%,%y2%, price.png
			if (Errorlevel=0){
			controlclick,,ahk_pid %packpid%,,,,X%X% Y%Y% NA
			;~ mousemove, %x%,%y%
;~ click
if (pack!="ghost"){
				loop{
				imagesearch,x,y,%x1%,%y1%,%x2%,%y2%,max.png
				if (Errorlevel=0){
				controlclick,,ahk_pid %packpid%,,,,X%X% Y%Y% NA
				sleep, 100
				break
}
					else if (Errorlevel=1){
					imagesearch,x,y,%x1%,%y1%,%x2%,%y2%,*80 continue.png
					if (Errorlevel=0){
					controlclick,,ahk_pid %packpid%,,,,X%X% Y%Y% NA
					;~ mousemove, %x%,%y%
;~ click
}
}
}
if (pack="ghost"){
				loop{
				imagesearch,x,y,%x1%,%y1%,%x2%,%y2%, max.png
				if (Errorlevel=0){
				controlclick,,ahk_pid %packpid%,,,,X%X% Y%Y% NA
				sleep, 100
				break
			}
					else if (Errorlevel=1){
					imagesearch,x,y,%x1%,%y1%,%x2%,%y2%,*80 continue.png
					if (Errorlevel=0){
					controlclick,,ahk_pid %packpid%,,,,X%X% Y%Y% NA
}
}
}
					sleep, 100
					loop{
						imagesearch,x,y,%x1%,%y1%,%x2%,%y2%,exit.png
						if (Errorlevel=0){
						sleep, 500
						y:=y-35
						controlclick,,ahk_pid %packpid%,,,,X%X% Y%Y% NA
						;~ mousemove, %x%,%y%
;~ click
						sleep, 1000
						controlclick,,ahk_pid %packpid%,,,,X%wrenchX% Y%wrenchY% NA
						;~ mousemove, %wrenchX%,%wrenchY%
;~ click
						sleep, 500
						controlclick,,ahk_pid %packpid%,,,,X%characterx% Y%charactery% NA
						;~ mousemove, %characterx%,%charactery%
;~ click
								loop{
									imagesearch,x,y,%x1%,%y1%,%x2%,%y2%, vend.png
									if (Errorlevel=0){
										tooltip, found
									break
								}
									if (Errorlevel=1){
									controlclick,,ahk_pid %packpid%,,,,X%characterx% Y%charactery% NA
															;~ mousemove, %characterx%,%charactery%
;~ click
tooltip, finding add machine
							}
						}
						sleep, 500
							loop{
							imagesearch,x,y,%x1%,%y1%,%x2%,%y2%, addmacine.png
							if (Errorlevel=0){
							sleep, 500
							controlclick,,ahk_pid %packpid%,,,,X%X% Y%Y% NA
							;~ mousemove, %x%,%y%
;~ click
							goto, end
							return
						}
						else if (Errorlevel=1){
								loop{
									imagesearch,x,y,%x1%,%y1%,%x2%,%y2%, vend.png
									if (Errorlevel=0){
									break
								}
									if (Errorlevel=1){
									controlclick,,ahk_pid %packpid%,,,,X%characterx% Y%charactery% NA
															;~ mousemove, %characterx%,%charactery%
;~ click
							}
						}
								imagesearch,x,y,%x1%,%y1%,%x2%,%y2%, 5000.png
								if (Errorlevel=0){
									sleep, 600
									Controlsend,,{Esc}{Esc},ahk_pid %packpid%
									sleep, 1000
									Controlsend,,{D DOWN},ahk_pid %packpid%
									sleep, 146
									Controlsend,,{D UP},ahk_pid %packpid%
									sleep, 500
									controlclick,,ahk_pid %packpid%,,,,X%wrenchX% Y%wrenchY% NA
									;~ mousemove, %wrenchX%,%wrenchY%
;~ click
									sleep, 100
									controlclick,,ahk_pid %packpid%,,,,X%characterx% Y%charactery% NA
									;~ mousemove, %characterx%,%charactery%
;~ click
									sleep, 300
									loop{
									imagesearch,x,y,%x1%,%y1%,%x2%,%y2%, putitem.png
										if (errorlevel=0){
										sleep, 1000
										controlclick,,ahk_pid %packpid%,,,,X%x% Y%y% NA
										;~ mousemove, %x%,%y%
;~ click
										sleep, 500
										controlclick,,ahk_pid %packpid%,,,,X%packx% Y%packy% NA
										;~ mousemove, %packx%,%packy%
;~ click
										sleep, 750
										Controlsend,,{Esc}{Esc},ahk_pid %packpid%
										goto, end
}
										if (errorlevel=1){
										controlclick,,ahk_pid %packpid%,,,,X%wrenchX% Y%wrenchY% NA
										;~ mousemove, %wrenchX%,%wrenchY%
;~ click
										sleep, 100
										controlclick,,ahk_pid %packpid%,,,,X%characterx% Y%charactery% NA
										;~ mousemove, %characterx%,%charactery%
;~ click
										sleep, 300
										}
}
}
}
}
}
;~ break
}
}
;~ break
}
;~ break
}
;~ break
}
break
}
}
}
}

return

end1:
goto, buyghost
return

end:
goto, buy
return

SetWindow:
isPressed:=0,i:= 0
Loop
{
Left_Mouse:=GetKeyState("LButton")
Escape:=GetKeyState("Esc")
MouseGetPos,TempX,TempY
if ((MouseX!=TempX) || (MouseY!=TempY)){
MouseGetPos,MouseX,MouseY
WinGetTitle,tempTitle,A
ToolTip,Auto Add Flour Window`n`nLeft Click on a window twice to set.`nPress ESC to cancel. `n`n Active Window: %tempTitle%
}
if (Escape==True){
tooltip,
return
}
if(Left_Mouse==False&&isPressed==0)
isPressed:=1
else if(Left_Mouse==True&&isPressed==1)
{
i++,isPressed:=0
if(i>=2)
{
WinGet,packPID,pid,A
GuiControl,,packpid,%packPID%
;~ Iniwrite,%FlourPID%,arch.ini,PID,flour
iniwrite,%packpid%,recon.ini,recon,packpid
Gui,Submit,NoHide
ToolTip,
break
}
}
}
return

Setpack:
isPressed:=0,i:= 0
Loop
{
Left_Mouse:=GetKeyState("LButton")
Escape:=GetKeyState("Esc")
MouseGetPos,TempX,TempY
if ((MouseX!=TempX) || (MouseY!=TempY)){
MouseGetPos,MouseX,MouseY
ToolTip,Character`n`nLeft Click on the Fist twice to set.`nPress ESC to cancel. `n`n Coordinate: %TempX%`,%TempY%
}
if (Escape==True){
tooltip,
return
}
if(Left_Mouse==False&&isPressed==0)
isPressed:=1
else if(Left_Mouse==True&&isPressed==1)
{
i++,isPressed:=0
if(i>=2)
{
MouseGetPos,packX,packY
GuiControl,,packEdit,%packX%`,%packy%
iniwrite,%packx%,recon.ini,recon,packx
iniwrite,%packy%,recon.ini,recon,packy
Gui,Submit,NoHide
ToolTip,
break
}
}
}
return

Setwrench:
isPressed:=0,i:= 0
Loop
{
Left_Mouse:=GetKeyState("LButton")
Escape:=GetKeyState("Esc")
MouseGetPos,TempX,TempY
if ((MouseX!=TempX) || (MouseY!=TempY)){
MouseGetPos,MouseX,MouseY
ToolTip,Character`n`nLeft Click on the Fist twice to set.`nPress ESC to cancel. `n`n Coordinate: %TempX%`,%TempY%
}
if (Escape==True){
tooltip,
return
}
if(Left_Mouse==False&&isPressed==0)
isPressed:=1
else if(Left_Mouse==True&&isPressed==1)
{
i++,isPressed:=0
if(i>=2)
{
MouseGetPos,wrenchx,wrenchy
GuiControl,,wrenchedit,%wrenchx%`,%wrenchy%
iniwrite,%wrenchx%,recon.ini,recon,wrenchx
iniwrite,%wrenchy%,recon.ini,recon,wrenchy
Gui,Submit,NoHide
ToolTip,
break
}
}
}
return

Setcharacter:
isPressed:=0,i:= 0
Loop
{
Left_Mouse:=GetKeyState("LButton")
Escape:=GetKeyState("Esc")
MouseGetPos,TempX,TempY
if ((MouseX!=TempX) || (MouseY!=TempY)){
MouseGetPos,MouseX,MouseY
ToolTip,Character`n`nLeft Click on the Fist twice to set.`nPress ESC to cancel. `n`n Coordinate: %TempX%`,%TempY%
}
if (Escape==True){
tooltip,
return
}
if(Left_Mouse==False&&isPressed==0)
isPressed:=1
else if(Left_Mouse==True&&isPressed==1)
{
i++,isPressed:=0
if(i>=2)
{
MouseGetPos,characterx,charactery
GuiControl,,characteredit,%characterx%`,%charactery%
iniwrite,%characterx%,recon.ini,recon,characterx
iniwrite,%charactery%,recon.ini,recon,charactery
Gui,Submit,NoHide
ToolTip,
break
}
}
}
return

Create_gem_png(NewHandle := False) {
Static hBitmap := 0
If (NewHandle)
   hBitmap := 0
If (hBitmap)
   Return hBitmap
VarSetCapacity(B64, 432 << !!A_IsUnicode)
B64 := "iVBORw0KGgoAAAANSUhEUgAAAAwAAAAMCAIAAADZF8uwAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAADXSURBVChTfc6tDoJQHAXw63R+TAh3I2giUJQHIIBzNJryEQxEnoAHsPgIFhpjsPE8JouRwEwELerkeJ0fc7rr2Ym/nf+foNMBpchzHA74Sl1fi+IcRWTfah0V5Zok2O1QVbhcnuKRskQck22jUVJ61nXMZlgsEAQIQ6xWWK+RZUhTLJdkQ0jRbJ7a7ftd1n4fkgRZhqpC02BZ8P0f9FlRxHgMx+GjbheDAUwTnsdHgoDRCLb9Fw2HmE6Z4CP2/muGj9g3k8lDcFCvd5+Zz/8iNmMYb1G77g0qudAd99t0wwAAAABJRU5ErkJggg=="
If !DllCall("Crypt32.dll\CryptStringToBinary", "Ptr", &B64, "UInt", 0, "UInt", 0x01, "Ptr", 0, "UIntP", DecLen, "Ptr", 0, "Ptr", 0)
   Return False
VarSetCapacity(Dec, DecLen, 0)
If !DllCall("Crypt32.dll\CryptStringToBinary", "Ptr", &B64, "UInt", 0, "UInt", 0x01, "Ptr", &Dec, "UIntP", DecLen, "Ptr", 0, "Ptr", 0)
   Return False
; Bitmap creation adopted from "How to convert Image data (JPEG/PNG/GIF) to hBITMAP?" by SKAN
; -> http://www.autohotkey.com/board/topic/21213-how-to-convert-image-data-jpegpnggif-to-hbitmap/?p=139257
hData := DllCall("Kernel32.dll\GlobalAlloc", "UInt", 2, "UPtr", DecLen, "UPtr")
pData := DllCall("Kernel32.dll\GlobalLock", "Ptr", hData, "UPtr")
DllCall("Kernel32.dll\RtlMoveMemory", "Ptr", pData, "Ptr", &Dec, "UPtr", DecLen)
DllCall("Kernel32.dll\GlobalUnlock", "Ptr", hData)
DllCall("Ole32.dll\CreateStreamOnHGlobal", "Ptr", hData, "Int", True, "PtrP", pStream)
hGdip := DllCall("Kernel32.dll\LoadLibrary", "Str", "Gdiplus.dll", "UPtr")
VarSetCapacity(SI, 16, 0), NumPut(1, SI, 0, "UChar")
DllCall("Gdiplus.dll\GdiplusStartup", "PtrP", pToken, "Ptr", &SI, "Ptr", 0)
DllCall("Gdiplus.dll\GdipCreateBitmapFromStream",  "Ptr", pStream, "PtrP", pBitmap)
DllCall("Gdiplus.dll\GdipCreateHBITMAPFromBitmap", "Ptr", pBitmap, "PtrP", hBitmap, "UInt", 0)
DllCall("Gdiplus.dll\GdipDisposeImage", "Ptr", pBitmap)
DllCall("Gdiplus.dll\GdiplusShutdown", "Ptr", pToken)
DllCall("Kernel32.dll\FreeLibrary", "Ptr", hGdip)
DllCall(NumGet(NumGet(pStream + 0, 0, "UPtr") + (A_PtrSize * 2), 0, "UPtr"), "Ptr", pStream)
Return hBitmap
}

guiclose:
ExitApp