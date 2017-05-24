def generar_digito_verificador(ruc, base_max=11):
    try:
        ruc = ruc if isinstance(ruc, str) else str(ruc)
        suma = 0
        for index, ruc_index in enumerate(range(len(ruc) - 1, -1, -1)):
            suma += int(ruc[ruc_index]) * (index + 2)
        r = suma % base_max

        return str(base_max - r if r > 1 else 0)
    except:
        return ''
