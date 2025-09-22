Esse script em **ngspice** está implementando um **parameter
sweep manual** (varredura de parâmetro), simulando o que
normalmente seria feito com um comando `.step`.

### O que ele faz:

1. **Define um divisor resistivo**:

   * R1 e R2 formam um divisor de tensão entre a fonte **VDD = 1 V**.
   * A tensão em `v(2)` depende do valor de **R1**:

     $$
     V(2) = VDD \cdot \frac{R2}{R1 + R2}
     $$

2. **Cria variáveis de controle**:

   ```
   let start_r = 1k
   let stop_r  = 10k
   let delta_r = 1k
   let r_act   = start_r
   ```

   → Começa com R1 = 1 kΩ e vai até 10 kΩ, em passos de 1 kΩ.

3. **Loop `while`**:

   * Em cada iteração:

     * Substitui o valor de **R1**:
       `alter r1 r_act`
     * Executa a análise **DC** já configurada:
       `run`
     * Salva os resultados (tensão no nó 2) em arquivo
     `dc-sweep.out`, adicionando cada nova simulação: `write
     dc-sweep.out v(2)`
     * Incrementa `r_act` em 1 kΩ.

   → Isso simula várias vezes o circuito, cada vez com R1 diferente.

4. **Plotagem**:

   * Depois de rodar todos os casos, o script plota
   várias curvas `dc1.v(2)`, `dc2.v(2)` … `dc10.v(2)`,
   que correspondem às diferentes simulações com R1 = 1k,
   2k, ..., 10k.

---

✅ **Resumo**:
Esse script faz uma **varredura do valor do resistor R1**
de 1 kΩ até 10 kΩ em passos de 1 kΩ, calcula a curva DC
do divisor de tensão para cada valor e, no final, plota a
tensão no nó 2 para todos os casos.

👉 Em outras palavras, ele **imita o comando `.step R1 1k 10k
1k`**, mas usando um loop `while` dentro do bloco `.control`.

---


Esse comando

```spice
.dc VDD 0 1 .1
```

é um **sweep DC (varredura em corrente contínua)** em **ngspice**.

### Estrutura do comando `.dc`

```
.dc <fonte> <início> <fim> <passo>
```

* **<fonte>** → nome da fonte de tensão ou corrente que será varrida.
* **\<início>** → valor inicial da varredura.
* **<fim>** → valor final.
* **<passo>** → incremento entre cada ponto da varredura.

### No seu caso:

* `VDD` → é a fonte de tensão definida como:

  ```
  VDD 1 0 DC 1
  ```
* `0` → início da varredura: 0 V
* `1` → fim da varredura: 1 V
* `.1` → passo: 0,1 V

### O que acontece

O ngspice vai rodar a análise DC **10 vezes**, variando a
fonte VDD de 0 V até 1 V em passos de 0,1 V:

```
VDD = 0.0 V
VDD = 0.1 V
VDD = 0.2 V
...
VDD = 1.0 V
```

Em cada ponto, ele calcula as tensões e correntes do circuito
em regime contínuo (sem tempo, só solução estática).

---

👉 Resumindo:
Esse comando faz a **curva de transferência DC** do circuito,
mostrando como a saída (ex.: V(2)) responde quando a fonte
`VDD` é varrida de 0 a 1 V.



