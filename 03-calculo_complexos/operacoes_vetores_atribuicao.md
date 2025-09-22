Boa! No ngspice dá pra fazer várias “reduções” e estatísticas direto no **.control** com `let` e as funções internas do interpretador (ngnutmeg). Aqui vai um **guia de bolso** com exemplos práticos:

### Média (escalares e média acumulada)

```spice
let m  = mean(v)     ; média (um escalar)
let ma = avg(v)      ; média acumulada (retorna um vetor)
```

`mean(v)` devolve um escalar com a média dos elementos de `v`, e `avg(v)` devolve um vetor cuja i-ésima amostra é a média das amostras 0..i de `v`【】.

### Mínimo / Máximo / Desvio-padrão

```spice
let vmin = minimum(v)
let vmax = maximum(v)
let s    = stddev(v)
```

As funções `minimum`, `maximum` e `stddev` são nativas【】.

### Integral e derivada (sobre a escala do vetor)

```spice
let vint = integ(v)   ; integral trapezoidal ao longo da escala (tempo, freq, etc.)
let dv   = deriv(v)   ; derivada numérica
```

`integ()` e `deriv()` operam ao longo do eixo de escala real do vetor (por ex., tempo)【】.

### Dicas para **soma** e **produto** dos elementos

O manual não traz um `sum()`/`prod()` prontos, mas dá pra compor facilmente:

* **Soma** dos elementos de `v`:

  ```spice
  let N = length(v)              ; número de amostras (função disponível no ngnutmeg)
  let soma_v = mean(v) * N
  ```

  (Usa o fato de que soma = média × quantidade. `mean(v)` é documentado【】. `length(v)` retorna o número de elementos do vetor.)

* **Produto** dos elementos de `v` (para valores positivos):

  ```spice
  let N = length(v)
  let prod_v = exp( mean(log(v)) * N )
  ```

  (Truque log-exp: produto = exp(∑log) = exp(N·média dos logs). Use apenas se `v > 0`; para zeros/negativos, trate à parte, e cuidado com `log(0)`.)

### Construindo vetores auxiliares (útil em composições)

```spice
let idx  = vector(10)     ; [0 1 2 ... 9]
let ones = unitvec(10)    ; [1 1 1 ... 1]
```

`vector(n)` cria um vetor 0..n-1 e `unitvec(n)` cria um vetor de uns【】.

---

#### Exemplos completos

* **Soma dos valores positivos de `v`**:

  ```spice
  let N = length(v)
  let soma_pos = mean( (v>0) ? v : 0 ) * N
  ```
* **Média de |v| (valor absoluto)**:

  ```spice
  let mabs = mean(abs(v))
  ```

  (`abs()`/`mag()` são nativas【】.)

Se quiser, me diga qual vetor você tem (por ex. `v(out)` do tran/AC) e eu te mostro os comandos exatos aplicados ao seu caso.

