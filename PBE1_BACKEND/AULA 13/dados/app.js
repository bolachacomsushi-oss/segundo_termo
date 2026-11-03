const fs = require('node:fs')
const caminho = require('node:path')
const ARQUIVO = caminho.join(__dirname, 'maquinas.json')

function carregarMaquinas() {
    const conteudo = fs.readFileSync(ARQUIVO, 'utf-8')
    const maquinas = JSON.parse(conteudo)

    if(!Array.isArray(maquinas)) {
        throw new Error ('O arquivo JSON deve conter uma lista de maquinas.')

    }
    return maquinas
}

function listarMaquinas(maquinas) {
    maquinas.forEach((maquinas) => {
        console.log(`${maquinas.id} | ${maquinas.nome} | ${maquinas.status}`)
    })
}

function buscaPorId(maquinas, id) {
    return maquinas.find((maquina) => maquina.id === id)
}

function filtrarPorStatus(maquinas, status) {
    return maquinas.filter((maquina) => maquina.status === status)
}

function filtrarPorSetor(maquinas, setor) {
    return maquinas.filter((maquina) => maquina.setor === setor)
}

function executar () {
    try {
        const maquinas = carregarMaquinas()
        console.log('\n=== TODAS AS MAQUINAS ===')
        listarMaquinas(maquinas)

        console.log('\n=== BUSCA PELO ID 3 ===')
        console.log(buscaPorId(maquinas, 3) ?? 'Maquina não encontrada')
        
        console.log('\n=== BUSCA PELO ID 99 ===')
        console.log(buscaPorId(maquinas, 99) ?? 'Maquina não encontrada')
        
        console.log('\n=== MAQUINAS EM MANUTENCAO ===')
        console.log(filtrarPorStatus(maquinas, "manutencao"))
        
        console.log('\n=== MAQUINAS USINAGEM ===')
        console.log(filtrarPorSetor(maquinas, "Usinagem"))
    }catch(erro) {
        process.exitCode = 1
    }

}

if (require.main === module) {
    executar();
}

module.exports = {
    carregarMaquinas,
    listarMaquinas,
    buscaPorId,
    filtrarPorStatus,
    filtrarPorSetor
}