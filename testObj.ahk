#NoEnv ;不检查空变量是否为环境变量（建议所有新脚本使用）。
; #NoTrayIcon ;不显示托盘图标。
#SingleInstance Ignore

obj := {}

obj.a := 1
obj.b := "test1"
var := obj.a

MsgBox  %var% 
