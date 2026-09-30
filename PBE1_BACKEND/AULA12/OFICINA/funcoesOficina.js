function calcularOrcamento(precoPeca, horasTrabalho) {
    const valorHora = 85.00;
    const totalMaoDeObra = horasTrabalho * valorHora;
    return precoPeca + totalMaoDeObra;
}

function verificarGarantia(meses) {
    if (meses <= 3) {
        return "Dentro da Garantia"
    }else {
        return "Fora da Garantia"
    }
}

// para o desconto criamos uma nova função
// o return garante a execução do xálculo e envio para o programa principal

function calcularDesconto(precoOriginal) {
    return precoOriginal * 0.80
}

module.exports = {
    calcularOrcamento,
    verificarGarantia,
    calcularDesconto
}