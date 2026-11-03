const entrada = require('readline-sync');
const oficina = require('funcoesOficina');

console.log("==== SISTEMA DE GESTAO DE OFICINA 1.0 ====");

const peca = entrada.questionFloat("Preco da peca: R$ ");
const horas = entrada.questionInt("Horas de servico: ");
const tempoUso = entrada.questionInt("Meses desde o ultimo conserto: ");

const total = oficina.calcularOrcamento(peca, horas);
const garantia = oficina.verificarGarantia(tempoUso);
const precoComDesconto = oficina.calcularDesconto(total);

console.log("\n--- RELATORIO DE SERVICO ---");
console.log(`Orcamento total: R$ ${total.toFixed(2)}`);
console.log(`Garantia                  ${garantia}`);
console.log(`Total com o desconto: ${precoComDesconto.toFixed(2)}`)
console.log("-------------------------------------------");