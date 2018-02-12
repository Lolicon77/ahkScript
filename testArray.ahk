#NoEnv ;不检查空变量是否为环境变量（建议所有新脚本使用）。
; #NoTrayIcon ;不显示托盘图标。
#SingleInstance Ignore

  ; 每个数组在使用前必须进行初始化:
  array := []

  var1 = test1

      array[1] := var1
      array[2] := 1
      array[3] := 1


  Loop 3
  {
      element := Array[A_Index]
      MsgBox % "Element number " . A_Index . " is " . Array[A_Index]
  }