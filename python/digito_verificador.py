def digito_verificador(ruc,baseMax=11)
	result = 0
	for index,ruc_index in enumerate(range(len(ruc)-1,-1,-1)):
	    result += int(ruc[ruc_index])*(index+2)
		r = result % baseMax
	verificador= baseMax - r if r > 1 else 0