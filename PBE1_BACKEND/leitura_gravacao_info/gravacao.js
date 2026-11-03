const fs = require('fs')

console.log("=== SISTEMA DE PERSISTENCIA DE DADOS ===")

const maquinasIndustriais = [
    {id: 101, nome: "Furadeira de Bancada", setor: "Usinagem", operacional: true},
    {id: 102, nome: "Prensa Hidraulica 40T", setor: "Estamparia", operacional: false},
    {id: 103, nome: "Torno automatico", setor: "Usinagem", operacional: true}
]

const dadodParaGravar = JSON.stringify(maquinasIndustriais, null, 2)

const nomeArquivo = "maquinas.json"
fs.writeFileSync(nomeArquivo, dadodParaGravar)

console.log('\nGravacao concluida com sucesso');
console.log(`Verifique o arquivo '${nomeArquivo}' gerado na pasta`)