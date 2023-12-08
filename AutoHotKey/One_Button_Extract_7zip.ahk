#Requires AutoHotkey v2.0

; This script uses 7zip 64-bit version

; Convert the ahk to exe and assign to a button on your macro keypad.
; Select the file you wish to extract in File Explorer
; Press the programmed key to extract to a subfolder with name of the file

; Clear the clipboard
A_Clipboard := ""

; Copy full path of selected file
Send "^+c"

; Wait for clipboard to not be empty
ClipWait

;Set filename to clipboard value
filename := A_Clipboard
;filename := "C:\file.zip"

;find the position of the dot before the file extension in the path
FoundPos:= Instr(filename,".",0,StrLen(filename)-5,1)

filepath := SubStr(filename,1,FoundPos-1)
args := " x "
args .= "`""
args .= filename
args .= "`""
args .= " -o"
args .= "`""
args .= filepath
args .= "`""
Run "C:\Program Files\7-Zip\7z.exe" args

;ListVars
;Pause