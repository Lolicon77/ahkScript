

WinGet, id, list,,, Program Manager
Loop, %id%
{
    this_id := id%A_Index%
    WinGetTitle, this_title, ahk_id %this_id%
    ; StringSplit, ColorArray, this_title, %A_Space%,
    MsgBox, %this_title%
 ;    Loop, %ColorArray0%
	; {
	;     this_color := ColorArray%a_index%
	;     MsgBox, Color number %a_index% is %this_color%.
	;     IfMsgBox, NO, break
	; }

}
return