; ; Example #2: 访问整个系统上所有窗口并显示它们的信息:
; WinGet, id, list,,, Program Manager
; Loop, %id%
; {
;     this_id := id%A_Index%
;     WinActivate, ahk_id %this_id%
;     WinGetClass, this_class, ahk_id %this_id%
;     WinGetTitle, this_title, ahk_id %this_id%
;     MsgBox, 4, , Visiting All Windows`n%a_index% of %id%`nahk_id %this_id%`nahk_class %this_class%`n%this_title%`n`nContinue?
;     IfMsgBox, NO, break
; }

; Example #2: 访问整个系统上所有窗口并显示它们的信息:
; WinGet, id, list,,, Program Manager
; currentExeArray:=[]

; currentAppDic := {}

; Loop, %id%
; {
;     this_id := id%A_Index%
;     WinGetTitle, this_title, ahk_id %this_id%
;     ; currentAppDic[%A_Index%] := %this_id% 
;     ; MsgBox,    currentAppDic[%A_Index%] 
;     MsgBox, 4, Visiting All Windows`n%a_index% of %id%`nahk_id %this_id%`n%this_title%`n`nContinue?
;     IfMsgBox, NO, break
; }

; a := ""
; For key, value in currentAppDic{
;     a = %a% %key% = %value%
; }
; MsgBox %a%


#NoEnv ;不检查空变量是否为环境变量（建议所有新脚本使用）。
; #NoTrayIcon ;不显示托盘图标。
#SingleInstance Ignore

; Gui, New, hwndhGui AlwaysOnTop +ToolWindow
; Gui, Add, Edit, w320 1  -Wrap vCtrl_Title
; GuiControl,, Ctrl_Title , test
; Gui, Show,, Test

; ~Esc::ExitApp
; ~Enter:: MsgBox, %Ctrl_Title%

; return

; GuiClose:
; ExitApp


; 创建含名称和大小两列的 ListView:
Gui, Add, ListView, w200 gMyListView, Title|Exe

WinGet, id, list,,, Program Manager
Loop, %id%
{
    this_id := id%A_Index%
    WinGetTitle, this_title, ahk_id %this_id%
    WinGetClass, this_exe, ahk_id %this_id%
    ; MsgBox, %this_title%`n %this_exe%
	; LV_Add("", %this_title%, %this_exe%)
}


; ; 从文件夹中获取文件名列表并把它们放入 ListView:
; Loop, %A_MyDocuments%\*.*
;     LV_Add("", A_LoopFileName, A_LoopFileSizeKB)

LV_ModifyCol()  ; 根据内容自动调整每列的大小.
LV_ModifyCol(2, "100 Integer")  ; 为了进行排序, 指出列 2 是整数.

; 显示窗口并返回. 每当用户点击一行时脚本会发出通知.
Gui, Show


$F1::
; LV_Modify(1, "Select")
MsgBox %  LV_GetCount("S")
; RowNumber = 0  ; 这样使得首次循环从列表的顶部开始搜索.
; Loop
; {
;     RowNumber := LV_GetNext(RowNumber)  ; 在前一次找到的位置后继续搜索.
;     if not RowNumber  ; 上面返回零, 所以选择的行已经都找到了.
;         break
;     LV_GetText(Text, RowNumber)
;     MsgBox The next selected row is #%RowNumber%, whose first field is "%Text%".
; }
return

MyListView:
if A_GuiEvent = DoubleClick
{
    LV_GetText(RowText, A_EventInfo)  ; 从行的第一个字段中获取文本.
    ToolTip You double-clicked row number %A_EventInfo%. Text: "%RowText%"
}
return

GuiClose:  ; 表示当窗口关闭时脚本应自动退出.
ExitApp


; 整数和浮点数: 在表达式中, 含有小数点的数字被视为浮点数; 否则视为整数. 对于大多数运算符（例如加法和乘法），只要其中的一个输入是浮点数，那么结果也将是浮点数。

; 不论在表达式中还是在表达式外的其他地方, 整数都可以表示成十六进制或十进制. 十六进制数必须以前缀 0x 开头. 例如，Sleep 0xFF 等同于 Sleep 255。在 v1.0.46.11+，可以识别用科学计数法表示的浮点数；但只有在它们含有小数点时才行（例如 1.0e4 和 -2.1E-4）。

; 强制使用表达式: 通过在表达式前加上百分号和空格或 tab, 能把表达式用在不直接支持表达式的参数中 (除了像 StringLen 的 OutputVar 和 InputVar 的那些参数). 这种技巧常用来访问 数组. 例如：
; FileAppend, % MyArray%i%, My File.txt
; MsgBox % "The variable MyVar contains " . MyVar . "."
; Loop % Iterations + 1
; WinSet, Transparent, % X + 100
; Control, Choose, % CurrentSelection - 1


