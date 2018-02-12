#SingleInstance force
$^F1::
	Loop{
		run,tencent://message/?uin=1282293413
		Sleep, 2000
		Clipboard = 老婆，多喝水，多起来活动一下，注意休息下眼睛
		Send, ^v{Enter}
		Sleep, 1800000
	}
Return