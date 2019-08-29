<?php
function generar_digito_verificador($ruc, $base=11)
{
    $res = 0; $m = 2; $r = 0;
    for ($i = strlen($ruc)-1; $i >= 0 ; $i--) {
        $a_ruc =  str_split($ruc);
        $res = $res + ($a_ruc[$i] * $m);
        $m++;
        $r = $res % $base;
    }
    if ($r>1){ $r = $base - $r; } else { $r = 0; }
    return $r;
}

// test it
// echo generar_digito_verificador("1234567");