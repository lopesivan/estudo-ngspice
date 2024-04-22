# variáveis

No ngspice, você pode definir e manipular variáveis usando
os comandos `let` e `set` tanto no modo interativo quanto
dentro de seções `.control` e `.endc`.

1. **Comando `let`**:

   - **Dentro de uma seção `.control`**: Usado para criar
     variáveis locais ou vetores para armazenar resultados
     de expressões ou funções. Por exemplo, você pode usar
     `let var = expression` para calcular e armazenar o resultado
     de uma expressão em `var` .

2. **Comando `set`**:
   - **Dentro de uma seção `.control`**: O comando `set` é
     utilizado para definir o valor de uma variável ou modificar
     configurações do simulador. Este comando permite atribuir
     valores numéricos, strings ou listas a uma variável. A
     sintaxe típica é `set variable=value`. Se nenhum valor
     for especificado, a variável será definida como `true` .
   - **No modo interativo**: O `set` funciona de forma similar,
     permitindo que você ajuste variáveis ou configurações
     durante uma sessão interativa. Por exemplo, `set temp=25`
     definiria a variável `temp` para 25 no contexto atual.

Ambos os comandos são parte integral da manipulação de
dados e controle de simulação em ngspice, permitindo uma
flexibilidade considerável na execução de simulações e
na análise de dados.

## vetores

No ngspice, a criação e manipulação de vetores podem ser
feitas usando os comandos `let` e `set` dentro do contexto de
uma seção `.control` e `.endc` ou em modo interativo. Aqui
está um exemplo de como você pode criar e operar com vetores:

### Criando Vetores com `let`

Você pode criar um vetor e armazenar valores nele usando
o comando `let`. Por exemplo, para criar um vetor chamado
`myvector` e atribuir uma série de valores numéricos a ele,
você usaria:

file: -> 01.sp

```ngspice
.control
let myvector = [1, 2, 3, 4, 5]
.endc
```

### Realizando Operações com Vetores

Após criar um vetor, você pode realizar várias operações
matemáticas. Por exemplo, suponha que você queira adicionar
um valor constante a cada elemento do vetor `myvector`. Você
poderia fazer isso com:

file: -> 02.sp

```ngspice
.control
let newvector = myvector + 1
.endc
```

Este comando adiciona 1 a cada elemento de `myvector`, resultando em `newvector` com os valores `[2, 3, 4, 5, 6]`.

### Uso do `set` para Configurar Parâmetros de Simulação

Enquanto o `let` é usado para manipulação de vetores e
variáveis, o `set` é frequentemente usado para configurar
parâmetros de simulação ou para definir variáveis
ambientais. Por exemplo, para definir a temperatura de
simulação:

```ngspice
.control
set temp=27
.endc
```

### Exemplo de Uso de Vetores em Análise

Se você quiser calcular a média dos valores em `myvector`,
poderia usar o seguinte comando:

```ngspice
.control
let average = avg(myvector)
echo "A média é: " average
.endc
```

Este exemplo mostra como criar vetores, realizar operações
simples e utilizar funções para processar dados em vetores
dentro do ngspice. Estes vetores e operações podem ser
extremamente úteis para análise de dados e automação de
tarefas de simulação complexas.
