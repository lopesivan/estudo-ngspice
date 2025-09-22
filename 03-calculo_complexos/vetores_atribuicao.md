Boa—no ngspice esse literal com colchetes **não** funciona para inicializar vetores. Os `[]` servem para **indexar** (e para descrever dimensões no `reshape`), e o manual diz que **não há um jeito direto** de criar um vetor novo com `let` já “preenchido”; a abordagem é alocar e depois inicializar, ou então usar `compose`【】【】.

Aqui vão jeitos que funcionam:

1. Lista explícita (recomendado)

```spice
compose v values 1 2 3 4
```

> `compose name values ...` cria o vetor; números negativos precisam de parênteses, p.ex. `(-2.5)`【】【】.

2. Faixa linear

```spice
compose v lin=4 start=1 stop=4     * gera 1,2,3,4
; ou
compose v start=1 stop=4 step=1
```

【】

3. Alocar com `let` e preencher por índices

```spice
let v = vector(4)   ; aloca 4 posições
let v[0]=1
let v[1]=2
let v[2]=3
let v[3]=4
```

> `let name = expr` cria vetor; elementos individuais mudam com `name[idx]`【】. O manual sugere alocar com `vector()`/`unitvec()` (e, se preciso, mudar tipo com `j()` e depois `reshape`)【】.

Resumindo: use `compose` pra “lista de valores” numa linha, ou `vector()+índices` quando quiser controle fino.



Use o jeito mais simples:

```spice
let v = 17*unitvec(20)
```

`unitvec(n)` cria um vetor de n elementos iguais a 1; multiplicando por 17, você ganha 20 valores todos 17. (O manual mostra `let bucket = unitvec(no_buck)  $ each element contains 1`.)&#x20;

Outras formas que também funcionam:

1. Com `compose` (gera vetores):

```spice
compose v lin=20 start=17 stop=17
```

Aqui `lin` define o número de pontos, `start` é v\[0] e `stop` é o último valor; com início=fim, todos os 20 pontos ficam 17. &#x20;

2. Alocando e preenchendo via expressão:

```spice
let v = 17 + 0*vector(20)
```

(`vector(n)` apenas aloca; a dica do manual é primeiro criar o vetor com `vector()` ou `unitvec()` e depois inicializar o conteúdo.)&#x20;

Bônus (complexo constante):

```spice
let vc = (17,0)*unitvec(20)     * 20 valores complexos 17+0j
```

(A conversão/uso de vetores complexos é feita com `j()` quando necessário.)&#x20;

Qualquer uma dessas três dá um vetor de tamanho 20 com todos os elementos = 17.

