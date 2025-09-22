Esse script é um **exemplo clássico de análise AC no ngspice**. Ele aparece inclusive no manual. Vamos destrinchar:

---

### Estrutura do circuito

```spice
* AC test
Iin 1 0 AC 1     ; Fonte de corrente senoidal de 1 A (valor de referência AC)
R1  1 2 100      ; Resistor de 100 Ω
L1  2 0 1        ; Indutor de 1 H
```

* A fonte `Iin` está marcada com `AC 1`. Isso não injeta um sinal no tempo, mas define **a excitação de pequeno-sinal** usada na análise AC (linearizada em torno do ponto de operação).
* O circuito é, portanto, uma malha série **fonte de corrente – resistor – indutor**.

---

### Comando de análise

```spice
AC LIN 101 10 10K
```

* `AC` → análise de resposta em frequência (pequeno sinal).
* `LIN 101` → 101 pontos igualmente espaçados.
* Frequência varrida de **10 Hz a 10 kHz**.

Durante essa varredura, o ngspice calcula as respostas como vetores **complexos** (magnitude e fase).

---

### Parte de controle e plots

```spice
plot v(2)           ; Parte real de v(2)
plot mag(v(2))      ; Magnitude
plot db(v(2))       ; 20·log10(magnitude), igual a vdb(2)
plot imag(v(2))     ; Parte imaginária
plot real(v(2))     ; Parte real (igual a plot v(2))
plot phase(v(2))    ; Fase em radianos
plot cph(v(2))      ; Fase contínua (sem saltos de ±π)
plot 180/PI*phase(v(2)) ; Fase em graus (conversão manual)
set units = degrees
plot phase(v(2))    ; Agora a fase já aparece em graus
```

Ou seja, ele mostra **todas as representações possíveis** de uma grandeza AC no ngspice:

* real, imaginária,
* magnitude, em dB,
* fase em radianos e graus,
* fase contínua (sem descontinuidades).

---

### Nome apropriado

Esse script serve para **ilustrar como visualizar diferentes formas de uma resposta AC**.
Um bom nome seria:

**`Exemplo de Análise AC – Magnitude e Fase (Bode)`**
ou mais curto: **`AC Analysis Demo`**.

---

Quer que eu adapte esse mesmo exemplo para gerar **diretamente um gráfico de Bode** (ganho em dB e fase em graus na mesma figura)?

