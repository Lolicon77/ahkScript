#NoEnv ;不检查空变量是否为环境变量（建议所有新脚本使用）。
; #NoTrayIcon ;不显示托盘图标。
#SingleInstance Ignore

intro := "alt+;启用搜索面板 esc隐藏 enter激活选中项"

DetectHiddenWindows, Off
Gui, +AlwaysOnTop -MaximizeBox -MinimizeBox -Resize +ToolWindow
Gui, Add, Edit,w600 vInputStr
Gui, Add, ListView,r10 w600 gMyListView, Title|Exe|Pid
Gui, Add, Text, , %intro%
Show()

Show(){
	global tempInput := "start"
	SetTimer, Update, 200
	GuiControl, Focus ,InputStr
	Gui, Show
}

Hide(){
	SetTimer, Update, Off
	LV_Delete()
	GuiControl, , InputStr,
	Gui, Hide
}

!;::
	Show()
return

#If WinActive("quickFind") or WinActive("test3.ahk")
$Esc::
	Hide()
Return

$Enter::
	LV_GetText(RowText, LV_GetNext(0), 3)  ; 从行的第一个字段中获取文本.
	WinActivate,ahk_id %RowText%
	Hide()
return

Update:
	GuiControlGet, inputString ,,InputStr
	if(inputString <> tempInput){
		tempInput := inputString

		LV_Delete()
		WinGet, id, list,,, Program Manager
		Loop, %id%
		{
		    this_id := id%A_Index%
		    WinGetTitle, t1 ,ahk_id %this_id%
			WinGet, t2, ProcessName , ahk_id %this_id%
			t1 :=  Trim(t1, OmitChars = " `t")
			StringLen, len, t1
			if(len > 1){
				while(len > 60){
					StringGetPos, pos, t1, %A_Space%, R%len%
					t1 := SubStr(t1, 1,pos)
					StringLen, len, t1
				}
				if(tempInput == "" or InStr(t1, tempInput) > 0 ){
					LV_Add("", t1 ,t2,this_id)
				}
			}
		}
		LV_ModifyCol()  ; 根据内容自动调整每列的大小.
		if(LV_GetCount() > 0){
			LV_Modify(1, "Select")
		}
	}
Return

MyListView:
if A_GuiEvent = DoubleClick
{
    LV_GetText(RowText, A_EventInfo, 3)  ; 从行的第一个字段中获取文本.
    WinActivate,ahk_id %RowText%
}
return

GuiClose:  ; 表示当窗口关闭时脚本应自动退出.
ExitApp
