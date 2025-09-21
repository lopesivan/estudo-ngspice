Questao #07

****************************************************************
* Descrição: Simulação do circuito no SPICE
****************************************************************
* Fonte:
*   _Vs = <169.71 V, 0°>          f = 60 Hz
*
* Tensões de referência:
*   _V1 = <118.79 V, 34.792°>
*   _V2 = <98.995 V, -43.213°>
*
* Elementos do circuito:
*   R1 = 6.2347 Ohm
*   R2 = 25.0 Ohm
*   L  = 0.077840 H = 77.8 mH
*
* Frequência angular:
*   w = 2·π·f = 2·3.1416·60 = 376.991 rad/s
*
* Reatância indutiva:
*   XL = w·L = (376.991·77.8 mH) = 29.345 Ohm
*
* Impedâncias:
*   _Z_bobina = 6.2347 + j29.345 = <30.000 Ohm, 78.005°>
*   _Z_total  = 31.235 + j29.345 = <42.857 Ohm, 43.213°>
*
* Corrente:
*   _I = 2.8859 – j2.7113 = <3.9598 A, -43.213°>
*
* Quedas de tensão:
*   V[R1]       = R1 · I     = 6.2347 Ohm · 3.9598 A  = 24.68 V
*   V[R2]       = R2 · I     =   25.0 Ohm · 3.9598 A  = 98.99 V
*   V[L1]       = XL · I     = 29.345 Ohm · 3.9598 A  = 116.28 V
*   V[Z_bobina] = Z_bobina·I = 30.000 Ohm · 3.9598 A  = 118.79 V
*   V[Z_total]  = Z_total ·I = 42.857 Ohm · 3.9598 A  = 169.71 V
*
* Convenções adotadas:
*   - Fásor: começa com "_" (ex.: _Vs é o fásor da fonte).
*   - Módulo: mesmo nome sem "_". (ex.: Vs é o módulo de _Vs).
*   - Tensões nos elementos: V[NomeElemento] indica o módulo
*     da tensão sobre esse elemento.
*

*---------------------------------------------------------------
* Circuito R-L-R com fonte senoidal 60 Hz (ngspice)
*---------------------------------------------------------------
.param Vs_rms = 120
.param V1_rms = 84
.param V2_rms = 70
.param f      = 60

.param raiz_2 = sqrt(2);
.param Vs = {Vs_rms * raiz_2}
.param V1 = {V1_rms * raiz_2}
.param V2 = {V2_rms * raiz_2}

.param PI = {atan(1)/4}  $ PI
.param A={Vs}
.param T={1/f}
.param w={2*PI*f}

* ===== Fonte =====
* Para análise TRANSIENTE: usar SINE(VOFF VAMP FREQ)
VS 1 0  sin(0 A f)

* ===== Elementos =====
L1 1 2 77.8m
R1 2 3 6.2347
R2 3 0 25

* ===== Fonte de tensão controlada: Amperímetro =====
E13 13 0  1 3  1

*---------------------------------------------------------------
* Parâmetros de simulação
*---------------------------------------------------------------
* Transiente: passo de impressão T/1000, simular 5 períodos
.tran {T/1000} {5*T}

* 👉 Assim, o `.CSPARAM` é especialmente útil quando você quer
* **passar valores calculados para a parte de controle**, como loops,
* condições, ou scripts automatizados no ngspice.
.csparam T = T

.control
	run
	listing e
.endc

.end
