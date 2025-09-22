Você pode transformar essas etapas numa **função** do ngspice (na linguagem do `.control`) usando `define`. A sintaxe é:

```
define nome(parametros...) expressão
```

Isso cria uma função “de usuário” que opera sobre vetores/escalares do ngspice.&#x20;

### Função para o módulo (norma Euclidiana, ‖v‖₂)

Para reproduzir exatamente seu cálculo `sqrt(mean(v*v) * length(v))`:

```spice
.control
* norma L2 de um vetor real (v*v é elemento-a-elemento)
define vnorm(x) sqrt( length(x) * mean(x*x) )

* exemplo de uso
compose v values 5 6
print vnorm(v)
.endc
```

* `compose ... values ...` cria o vetor de teste.&#x20;
* `mean(vector)` devolve um **escalar** com a média dos elementos (logo, `mean(x*x)*length(x)` = soma dos quadrados).&#x20;
* Operações e funções atuam naturalmente em **vetores** no interpretador (ex.: `x*x`, `sqrt(...)`, etc.).&#x20;

### Versão para vetores **complexos** (ex.: resultados de AC)

Se o vetor tiver partes real/imag (como `v(2)` em AC), use o módulo de cada amostra:

```spice
define vnormc(x) sqrt( length(x) * mean( mag(x)^2 ) )
```

Aqui `mag(vector)` dá o módulo de cada elemento complexo.&#x20;

### Dica

* Quer guardar a função para todas as sessões? Coloque os `define ...` no seu `~/.spiceinit` ou dentro do bloco `.control` do arquivo do circuito. (O interpretador de comandos do Cap. 13 é justamente para isso.)&#x20;

Se quiser, posso te devolver uma mini “biblioteca” com `vnorm`, `vnormc` e até `vrms(x) = sqrt(mean(x*x))` (RMS).

