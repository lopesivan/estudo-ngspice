perfeito — aqui vai uma mini “biblioteca” com funções úteis (norma, RMS, soma, etc.). Você pode:

* **colar dentro do seu bloco `.control`** do circuito, ou
* **colocar no `~/.spiceinit`** (sem o `.control`), para ficar sempre disponível.

## Versão p/ usar dentro de `.control`

```spice
.control
* ===== Estatística / reduções =====
define vlen(x)     length(x)
define vmean(x)    mean(x)
define vsum(x)     (length(x)*mean(x))             ; soma (funciona p/ real e complexo)

define vmin(x)     minimum(x)
define vmax(x)     maximum(x)
define vstd(x)     stddev(x)

* ===== Cálculo no eixo (tempo/freq) =====
define vint(x)     integ(x)                         ; integral trapezoidal
define vder(x)     deriv(x)                         ; derivada numérica

* ===== Normas e RMS =====
define vnorm(x)    sqrt( length(x)*mean(x*x) )      ; ‖x‖2 (vetor real)
define vnormc(x)   sqrt( length(x)*mean( mag(x)^2 ) ) ; ‖x‖2 (vetor complexo)

define vrms(x)     sqrt( mean(x*x) )                ; RMS (real)
define vrmsc(x)    sqrt( mean( mag(x)^2 ) )         ; RMS (complexo)

* ===== Produto (atenção a sinais/zeros) =====
define vprodpos(x) exp( length(x)*mean( log(x) ) )  ; produto, só p/ x>0
define vprodm(x)   exp( length(x)*mean( log(mag(x)) ) ) ; produto das magnitudes

* ===== Exemplos rápidos =====
compose v values 5 6
print vnorm(v) vrms(v) vsum(v) vmin(v) vmax(v)
.endc
```

## Versão p/ `~/.spiceinit` (mesmas definições, **sem** `.control`)

```spice
define vlen(x)     length(x)
define vmean(x)    mean(x)
define vsum(x)     (length(x)*mean(x))
define vmin(x)     minimum(x)
define vmax(x)     maximum(x)
define vstd(x)     stddev(x)
define vint(x)     integ(x)
define vder(x)     deriv(x)
define vnorm(x)    sqrt( length(x)*mean(x*x) )
define vnormc(x)   sqrt( length(x)*mean( mag(x)^2 ) )
define vrms(x)     sqrt( mean(x*x) )
define vrmsc(x)    sqrt( mean( mag(x)^2 ) )
define vprodpos(x) exp( length(x)*mean( log(x) ) )
define vprodm(x)   exp( length(x)*mean( log(mag(x)) ) )
```

### Notas rápidas

* `vsum(x)` usa a identidade **soma = média × comprimento**.
* Para **complexos**, use `vnormc/vrmsc` (aplicam `mag()` elemento-a-elemento).
* `vprodpos` exige **x > 0** (evite zeros/negativos por causa de `log`). Para complexos, `vprodm` dá o **produto das magnitudes**.

