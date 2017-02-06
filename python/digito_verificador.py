def digito_verificador(ruc,base_max=11)
        result = 0
        for index,ruc_index in enumerate(range(len(ruc)-1,-1,-1)):
                result += int(ruc[ruc_index])*(index+2)
                r = result % base_max
        verificador= base_max - r if r > 1 else 0
        return verificador
