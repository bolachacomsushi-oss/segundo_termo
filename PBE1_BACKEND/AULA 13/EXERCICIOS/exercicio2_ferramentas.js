const fs = require('fs')
const entrada = require('readline-sync')

console.log("==== CADASTRO DE FERRAMENTAS ====")

const ferramentas = entrada.questionInt("Quantas ferramentas serao registradas? ")
const lista = []


for(let i = 0; i < ferramentas; i++) {
    console.log(`\nFerramenta ${i + 1} de ${ferramentas}: `)
    const nome = entrada.question("Digite o nome da ferramenta: ");
    const quantidade = entrada.questionInt("Digite a quantidade de ferramentas: ");;
    const custoUnitario = entrada.questionFloat("Digite o custo unitario (R$): ");

    lista.push({
        nome: nome,
        quantidade: quantidade,
        custoUnitario: custoUnitario,
    })
}

fs.writeFileSync('ferramentas.json', JSON.stringify(lista, null, 2))

console.log(`Sucesso: ${lista.length} itens gravados em 'ferramentas.json'.`);
