# Exemplos de Criação de Vetores no ngspice

Este documento explica o processo de criação e manipulação
de vetores no ngspice, utilizando um script de exemplo chamado
`01-vector.sp`.

## Script ngspice

O script contém comandos para criar e manipular vetores
no ambiente `.control` do ngspice. Aqui está o conteúdo e
explicação do script:

```spice
.control
# criando vetor de reais de tamanho 5
let myvec = vector(5)
print myvec  ; imprime o vetor

# Erro de tentativa de acessar dimensões incorretas
let myvec[0][0] = (pi, pi) ; Too many dimensions given. Only 1 are present.

# Redefinindo myvec para um valor complexo singular
let myvec = (pi, pi)
print myvec

# Cria um vetor de tamanho 5 de complexos
let myvec = j(vector(5))
print myvec

# Tentativa errada de atribuir valor complexo considerando múltiplas dimensões
let myvec[0][0] = (pi, pi) ; Too many dimensions given. Only 1 are present.

# Atribuição correta de um valor complexo na primeira posição
let myvec[0] = (pi, pi)
print myvec

.endc

.end
```

### Descrição dos Comandos

1. **Criação de um Vetor de Reais**:
   - `let myvec = vector(5)` cria um vetor `myvec` com 5
                             elementos inicializados em zero.

2. **Impressão do Vetor**:
   - `print myvec` exibe os valores do vetor no console.

3. **Erro ao Acessar Vetor**:
   - `let myvec[0][0] = (pi, pi)` tenta atribuir um valor complexo a um
                                  vetor tratando-o como uma matriz
                                  bidimensional, o que gera um erro
                                  porque `myvec` tem apenas uma dimensão.

4. **Redefinição de Vetor para Valor Complexo**:
   - `let myvec = (pi, pi)` redefine `myvec` para armazenar
                            um único valor complexo `(π, π)`.

5. **Criação de Vetor Complexo**:
   - `let myvec = j(vector(5))` cria um novo vetor `myvec`
                                com 5 elementos complexos inicializados
                                em zero.

6. **Atribuição Correta em Vetor Complexo**:
   - `let myvec[0] = (pi, pi)` atribui corretamente um valor
                               complexo à primeira posição de `myvec`.

## Saída do ngspice

Ao rodar o script `01-vector.sp` com o comando `ngspice -b
01-vector.sp`, obtemos a seguinte saída:

```output
Note: No compatibility mode selected!

Circuit: exemplo 01

                                Constant values
                                constants  Wed Dec 27 18:41:13 UTC 2023
--------------------------------------------------------------------------------
Index   myvec
--------------------------------------------------------------------------------
0       0.000000e+00
1       1.000000e+00
2       2.000000e+00
3       3.000000e+00
4       4.000000e+00
Too many dimensions given. Only 1 are present.
myvec = 3.141593e+00,3.141593e+00
                                Constant values
                                constants  Wed Dec 27 18:41:13 UTC 2023
--------------------------------------------------------------------------------
Index   myvec
--------------------------------------------------------------------------------
0       0.000000e+00,   0.000000e+00
1       0.000000e+00,   1.000000e+00
2       0.000000e+00,   2.000000e+00
3       0.000000e+00,   3.000000e+00
4       0.000000e+00,   4.000000e+00
Too many dimensions given. Only 1 are present.
                                Constant values
                                constants  Wed Dec 27 18:41:13 UTC 2023
--------------------------------------------------------------------------------
Index   myvec
--------------------------------------------------------------------------------
0       3.141593e+00,   3.141593e+00
1       0.000000e+00,   1.

000000e+00
2       0.000000e+00,   2.000000e+00
3       0.000000e+00,   3.000000e+00
4       0.000000e+00,   4.000000e+00
Note: No ".plot", ".print", or ".fourier" lines; no simulations run
```

### Análise da Saída

- **Impressões Iniciais**: Mostram os valores inicializados
do vetor `myvec` como reais e depois como complexos.
- **Erros de Dimensão**: Indicam tentativas incorretas de
manipulação de dimensões do vetor.
- **Valores Finais**: Mostram a correta atribuição de
valores complexos ao vetor `myvec`.

