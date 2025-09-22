Sim — dá pra “digitar em polar” no ngspice montando o número complexo a partir de módulo e ângulo. No interpretador (`.control`/`let`) use a identidade de Euler:

* **Forma polar (ângulo em radianos):**
  `let Z = M * exp( j(phi) )`  onde `j(x)` devolve $j\cdot x$ e `exp()` aceita argumento complexo. &#x20;
  Dica: o ângulo que o `ph()` retorna é em **radianos**.&#x20;

* **Se o seu ângulo estiver em graus:**
  defina um atalho e use graus→rad:

  ```
  define pol(m,deg) ( m * exp( j(deg*PI/180) ) )
  ```

  (O `define` cria funções no modo de controle.)&#x20;
  Ex.:
  `let Vs = pol(169.71, 0)`
  `let V1 = pol(97.557, 67.783)`
  `let V2 = pol(72.148, -67.783)`

* **Checar módulo e fase depois:**
  `mag(V1)` dá o módulo; `ph(V1)*180/PI` dá a fase em graus.&#x20;

* **Alternativa sem `exp()`:**
  `let Z = M*( cos(phi) + j( sin(phi) ) )` (útil pra visualizar a forma $M\cos\phi + j M\sin\phi$). &#x20;

* **Curiosidade:** escrever `a , b` é o mesmo que `a + j(b)` (por isso `(25,0)` funciona como “retangular”).&#x20;

Pronto: com `pol(m,deg)` você entra seus fasores em graus de forma direta, e com `mag`/`ph` você confere os resultados.

