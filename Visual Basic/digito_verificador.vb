Function getDV(RUC As String) As String
	getDV = calcular(RUC, 11)
End Function


Function calcular(numero As String, basemax As Integer) As String
	Dim codigo As Long
	Dim numero_al As String
	
	Dim i
	For i = 1 To Len(numero)
		Dim c
		c = Mid$(numero, i, 1)
		codigo = Asc(UCase(c))
		If Not (codigo >= 48 And codigo <= 57) Then
			numero_al = numero_al & codigo
		Else
			numero_al = numero_al & c
		End If
	Next
	
	Dim k: Dim total
	k = 2
	total = 0
	
	For i = Len(numero_al) To 1 Step -1
		If (k > basemax) Then k = 2
		Dim numero_aux
		numero_aux = Val(Mid(numero_al, i, 1))
		total = total + (numero_aux * k)
		k = k + 1
	Next
	
	
	Dim resto: Dim digito
	resto = total Mod 11
	If (resto > 1) Then
		digito = 11 - resto
	Else
		digito = 0
	End If
	calcular = digito
End Function
