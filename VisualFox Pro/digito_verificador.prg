*
* consultarDV.prg
*
* Derechos Reservados (c) 2000-2009 José Acuña
* Villa Elisa, Paraguay
*
* Descripción:
* Calcula el dígito verificador del RUC.
*
* Compilador / Lenguaje:
* Microsoft Visual Foxpro 9.0 Service Pack 1.
*
* Historial de Modificación:
* Enero 03, 2009     Creación del Programa
*
PARAMETERS tcRUC
 
LOCAL lnDV AS INTEGER
lnDV = calcular(tcRUC, 11)
 
RETURN (lnDV)
 
*------------------------------------------------------------------------------*
FUNCTION calcular
   PARAMETERS tcNumero, tnBaseMax
 
   LOCAL lcNumeroAl, i, lcCaracter, k, lnTotal, lnNumeroAux, lnResto, lnDigito
 
   lcNumeroAl = ""
 
   FOR i = 1 TO LEN(tcNumero)
      lcCaracter = UPPER(SUBSTR(tcNumero, i, 1))
 
      IF !BETWEEN(ASC(lcCaracter), 48, 57) THEN   && de 0 a 9
         lcNumeroAl = lcNumeroAl + ALLTRIM(STR(ASC(lcCaracter)))
      ELSE
         lcNumeroAl = lcNumeroAl + lcCaracter
      ENDIF
   ENDFOR
 
   k = 2
   lnTotal = 0
 
   FOR i = LEN(lcNumeroAl) TO 1 STEP -1
      IF k > tnBaseMax THEN
         k = 2
      ENDIF
 
      lnNumeroAux = VAL(SUBSTR(lcNumeroAl, i, 1))
      lnTotal = lnTotal + (lnNumeroAux * k)
      k = k + 1
   ENDFOR
 
   lnResto = MOD(lnTotal, 11)
 
   IF lnResto > 1 THEN
      lnDigito = 11 - lnResto
   ELSE
      lnDigito = 0
   ENDIF
 
   RETURN (lnDigito)
ENDFUNC