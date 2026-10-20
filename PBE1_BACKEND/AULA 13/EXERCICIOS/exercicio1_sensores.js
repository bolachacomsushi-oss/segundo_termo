const fs = require('fs')

console.log("==== REGISTRO DE SENSORES ====")

const sensores = [
    { id: 1001, tipo: "temperatura", leituraAtual: 1.5, status: "Operando"},
    { id: 1002, tipo: "pressao", leituraAtual: 7.5, status: "Alerta"},
    { id: 1003, tipo: "temperatura", leituraAtual: 3.55, status: "Alerta"}
]

const dadosJSON = JSON.stringify(sensores, null, 2)

const nomeArquivo = "sensores.json"
fs.writeFileSync('sensores.json', dadosJSON)

console.log(`\nGravação concluída com sucesso.`)
console.log(`Verifique o arquivo ${nomeArquivo} gerado`)