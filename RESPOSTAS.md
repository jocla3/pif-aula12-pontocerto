# Respostas da dupla — Atividade PontoCerto

## Dupla

| Papel | Nome completo | Usuário do GitHub |
|---|---|---|
| Integrante 1 (dono do fork) | João Cláudio Beltrão | jocla3 |
| Integrante 2 (colaborador) | Marcelo Bresani | mbvo1 |

## Explicação da solução

`calculaPontos` concentra a aplicação de uma regra ao valor da compra.  
As campanhas são funções do tipo `Int -> Int`, guardadas em variáveis e passadas como argumentos.  
As fábricas recebem um multiplicador ou bônus e devolvem uma lambda que guarda esse valor.  
Assim, novas campanhas reutilizam o mesmo cálculo, e `acumula` permite combinar duas regras na ordem desejada.

## Desafio 2

As duas promoções têm regras curtas, usadas uma única vez. Passar uma lambda diretamente para `calculaPontos` deixa a regra junto do uso, sem criar nomes adicionais. A Promoção Relâmpago usa `\p -> p * 3`, e a Quarta Verde usa `\p -> p * 2 + 10`.

## Desafio 3

`campanhaMultiplicadora 5` devolve uma função que recebe os pontos e os multiplica por 5. Ainda não devolve um número, pois falta receber os pontos. No GHCi, `:t campanhaMultiplicadora 5` mostra `Int -> Int`, confirmando que o resultado é uma função. `:t blackFriday` também mostra `Int -> Int`.

## Desafio 4

**a)** A ordem altera o valor que será multiplicado. Primeiro Black Friday e depois aniversário: `150 * 5 + 200 = 950`. Primeiro aniversário e depois Black Friday: `(150 + 200) * 5 = 1750`. Na segunda ordem, os 200 pontos de bônus também são multiplicados.

**b)** O sistema deve aplicar primeiro `blackFriday` e depois `aniversarioCliente`, usando `acumula blackFriday aniversarioCliente 150`. Assim, multiplica apenas os pontos da compra e acrescenta o bônus ao final, resultando em 950 pontos.
**Semana do Cliente:** `campanhaMultiplicadora 3` fabrica a regra que triplica os pontos, e a lambda `\p -> p + 100` acrescenta o bônus. Para a compra de R$ 60, `acumula` aplica primeiro a multiplicação e depois a soma: 60 * 3 + 100 = 280 pontos.

## Desafio 5 — revisão de código

As correções foram feitas uma por vez, verificando novamente o arquivo com GHC após cada alteração. A ordem abaixo começa pelo erro de sintaxe, que impede a análise dos tipos. As mensagens são resumos dos diagnósticos observados.

| Erro | Função | O que estava errado | Como o GHC avisou (resumo da mensagem) | Como corrigimos |
|---|---|---|---|---|
| 1 | `fimDeSemana` | A lambda usava `=>` em vez de `->`. | Erro de análise sintática no símbolo `=>`. | `fimDeSemana = \p -> p * 4` |
| 2 | `aplicaRegraDuasVezes` | A assinatura declarava `regra` como `Int`, mas o corpo a chamava como função. | A função `regra` foi aplicada a um argumento, mas seu tipo `Int` não recebe argumentos. | `aplicaRegraDuasVezes :: (Int -> Int) -> Int -> Int` |
| 3 | `natal` | A fábrica foi atribuída sem receber o bônus de 300. | Esperado `Int -> Int`, encontrado `Int -> Int -> Int`; argumentos insuficientes para `campanhaBonus`. | `natal = campanhaBonus 300` |
| 4 | `promocaoAtual` | `pontosEmDobro 100` produzia um número, mas a variável deveria guardar uma função. | Esperado `Int -> Int`, encontrado `Int`; `pontosEmDobro` recebeu argumentos demais nesse contexto. | `promocaoAtual = pontosEmDobro` |

As duas funções originalmente corretas e as instruções do `main` foram preservadas. Os comentários foram removidos conforme solicitado.

## Desafio 6 — Haskell × C

1. Em Haskell, a regra é um valor de função, e a assinatura é `(Int -> Int) -> Int -> Int`. Em C, o parâmetro é um ponteiro para função, declarado como `int (*regra)(int)`.
2. Haskell aplica a função com `regra valor`, sem parênteses obrigatórios para a chamada; o resultado é a expressão do corpo. C usa `regra(valor)` e devolve o resultado explicitamente com `return`.
3. 3. Em Haskell dá para passar uma lambda direto para `calculaPontos` ou fabricar regras novas com `campanhaMultiplicadora 5`. Em C padrão não existem lambdas: toda regra precisa ser uma função nomeada, escrita antes do uso, como `pontosEmDobro` e `bonus50`.

## Evidência de execução

Os três programas foram compilados e executados. Todas as saídas abaixo foram capturadas da execução e comparadas com os resultados do enunciado. Haskell foi compilado com `-Wall -Werror`; C, com `-std=c11 -Wall -Wextra -Wpedantic -Werror` e sanitizadores de memória e comportamento indefinido.

Saída do `main` de `fidelidade.hs`:

```text
--- Desafio 1 ---
120
240
170
240
--- Desafio 2 ---
80
160
130
240
170
--- Desafio 3 ---
750
350
100
55
--- Desafio 4 ---
950
1750
280
```

Saída do `main` de `revisao.hs` (depois de corrigido):

```text
40
100
400
200
```

Saída de `pontocerto.c`:

```text
160
130
250
300
```

Conferência de tipos no GHCi e teste de 48 combinações de multiplicadores, bônus e valores de compra:

```text
campanhaDaSemana :: Int -> Int
campanhaMultiplicadora 5 :: Int -> Int
blackFriday :: Int -> Int
True
```
