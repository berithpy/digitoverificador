digitoVerificador = function (ruc, baseMax = 11) {
    ruc = typeof ruc === 'string' ? ruc : ruc.toString()
    var resultado = 0
    var index = 0;
    for (var rucIndex = ruc.length - 1; rucIndex >= 0; rucIndex--) {
        resultado += parseInt(ruc[rucIndex]) * (index + 2);
        var r = resultado % baseMax
        index++;
    };
    var verificador = r > 1 ? baseMax - r : 0
    return verificador
}
