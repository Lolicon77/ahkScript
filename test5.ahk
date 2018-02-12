; #SingleInstance Ignore
$F1::
MouseGetPos, x,y
MsgBox, %x%,%y%
Return


$F2::
Send,{Click 405 317}
Send, abc
Send,{Click 680 255}
Sleep, 500
Send,{Click 680 255 2}
Sleep, 500
Send,{Click 680 255 2}
Sleep, 500
Send,{Click 680 255 2}
Sleep, 500
Send,{Click 680 255 0}
return


$F3::
InputBox, UserInput, Phone Number, Please enter a task id., , 300, 100
if ErrorLevel
    MsgBox, CANCEL was pressed.
else
    ; MsgBox, You entered 30+%UserInput%
    Send,{Click 405 317}
	Send, %UserInput%
return

$F4::
; MouseGetPos , , , id , control ;
; MsgBox, %id%,%control%

Send  % getAscStr("-Log")

getAscStr(str)
{
    charList:=StrSplit(str)
    for key,val in charList
        out.="{Asc " . asc(val) . "}"
    return out
}
Return