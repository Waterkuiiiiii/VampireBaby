#NoEnv
; #Warn
SendMode Input
SetWorkingDir %A_ScriptDir%

#SingleInstance, force
CoordMode, Pixel, Screen
#MaxThreadsPerHotkey, 2
;-----------------------------------------------------------------
;Set Tray Icon
Menu, Tray, Icon, %A_ScriptDir%\Pictures\VampireBabyTray.ico
;Hotkeys for Exit and Reload.
CapsLock & Escape::
SetCapsLockState, off
ExitApp, 0
return
CapsLock & r::Reload
return
;-----------------------------------------------------------------
;Ctrl + Direction Key can hold on this key.
#If WinActive("ahk_exe VampireSurvivors.exe")
^Up::
Send, {Up down}
return

^Down::
Send, {Down down}
return

^Left::
Send, {Left down}
return

^Right::
Send, {Right down}
return

PgUp::
Send, {Up up}{Down up}{Left up}{Right up}
return
;-----------------------------------------------------------------
;Key Mapping
Home::Down
return
End::Up
return
Del::Right
return
PgDn::Left
return
;-----------------------------------------------------------------
;Make MissingN FINO Max Max health is negative
isToggle := false
isFoundIt := false

Ins::
(isToggle := !isToggle) ? MissingNPrepareEgg() : ReloadFunc()
MissingNPrepare()
attemptsNum := 0
MissingN(attemptsNum, false)
return

^Ins::
(isToggle := !isToggle) ? MissingNPrepareEgg() : ReloadFunc()
MissingNPrepare()
attemptsNum := 0
MissingN(attemptsNum, true)
return

;Determine if the golden egg is ticked and untick it if it is.
MissingNPrepareEgg(){
	ImageSearch, eggTickedX, eggTickedY, 367, 976, 417, 1025, %A_ScriptDir%\Pictures\EggTicked.png
	If (ErrorLevel = 0)
	{
		MouseClick, Left, eggTickedX, eggTickedY, 1, 1
	}
}

;Determine if the missingN is selected and deselected it if it is.
MissingNPrepare(){
	MouseMove, 946, 515, 1
	Loop
	{
		ImageSearch, missingX, missingY, 555, 190, 1330, 890, %A_ScriptDir%\Pictures\MissingN.png
		If (ErrorLevel = 0)
		{
			break
		}
		Send, {WheelDown}
	}
	MouseClick, Left, missingX + 87, missingY + 87, 1, 1
}

MissingN(pAttemptsNum, pIsCtrl){
	Loop
	{
		ImageSearch, MinusZeroX, MinusZeroY, 180, 246, 486, 280, %A_ScriptDir%\Pictures\Max Health Minus Zero.png
		If (ErrorLevel = 0)
		{
			isFoundIt := true
		}

		ImageSearch, MinusOneX, MinusOneY, 180, 246, 486, 280, %A_ScriptDir%\Pictures\Max Health Minus One.png
		If (ErrorLevel = 0)
		{
			isFoundIt := true
		}

		ImageSearch, MinusTwoX, MinusTwoY, 180, 246, 486, 280, %A_ScriptDir%\Pictures\Max Health Minus Two.png
		If (ErrorLevel = 0)
		{
			isFoundIt := true
		}

		ImageSearch, MinusTwoX, MinusTwoY, 180, 246, 486, 280, %A_ScriptDir%\Pictures\Max Health Minus Three.png
		If (ErrorLevel = 0)
		{
			isFoundIt := true
		}

		If (isFoundIt)
		{
			break
		}

		Send, {Escape}
		Sleep, 100
		Send, {Space}
		If (pIsCtrl)
		{
			MissingNPrepare()
		}
		Sleep, 1000

		pAttemptsNum++
	}

	If (pAttemptsNum = 0)
	{
		MsgBox, 0, Vampire Baby, You're so blind.`nI tried a total of %pAttemptsNum% times.`n(´｡• ω •｡`)	
	}
	else If (pAttemptsNum <= 7)
	{
		MsgBox, 0, Vampire Baby, I Found It.`nI tried a total of %pAttemptsNum% times.`nI am a LUCKY BABY.`n૮ ˶ᵔ ᵕ ᵔ˶ ა
	}
	else If (pAttemptsNum <= 37)
	{
		MsgBox, 0, Vampire Baby, I Found It.`nI tried a total of %pAttemptsNum% times.`nI am a AVERAGE LUCKY BABY(＾• ω •＾)
	}
	else If (pAttemptsNum <= 77)
	{
		MsgBox, 0, Vampire Baby, I Found It.`nI tried a total of %pAttemptsNum% times.`nBAD LUCKY.૮₍ ˃ ⤙ ˂ ₎ა
	}
	else If (pAttemptsNum <= 97)
	{
		MsgBox, 0, Vampire Baby, 
		(
			I tried a total of %pAttemptsNum% times.`nNever mind that, I drew a cute cat.(Boring)
⠀            ／＞　 フ
             | 　_　_| 
          ／` ミ＿xノ < meow )♡
         /　　　　 |
        /　 ヽ　　 ﾉ
        │　　|　|　|
／￣|　　 |　|　|
(￣ヽ＿_ヽ_)__)
＼二)
		)
	}
	else If (pAttemptsNum < 1000)
	{
		MsgBox, 0, Vampire Baby,
		(
			I tried a total of %pAttemptsNum% times.`nLook, I drew a muscle rabbit and it looks cute.(So Boring)
⠀           (\ __ /)
              (UwU)
       ＿ノ ヽ ノ＼＿ 
    /　`/ ⌒Ｙ⌒ Ｙ　 \
 ( 　(三ヽ人　 /　 　|
|　ﾉ⌒＼ ￣￣ヽ　 ノ
ヽ＿＿＿＞､＿＿／
          ｜( 王 ﾉ〈 
           /ﾐ`ー―彡\ 
          |╰         ╯|   
          |       /\       |
          |      /  \      |
          |    /     \     |
		)
	}
	else If (pAttemptsNum >= 1000)
	{
		MsgBox, 0, Vampire Baby, I tried a total of %pAttemptsNum% times.So I have reason to suspect that you didn't choose MissngN.`nYou're an idiot.`n:(
	}
}

ReloadFunc()
{
	Reload
}