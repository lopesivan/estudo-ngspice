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
.param A=169.71 f=60 T={1/f}
.param w={2*3.14*f}

* ===== Fonte =====
* Para análise TRANSIENTE: usar SINE(VOFF VAMP FREQ)
*VS 1 0  sin(0 A f)

* Para análise AC (pequeno sinal, fásor):
* (opcional; use APENAS quando for rodar .ac)
*VS 1 0  sin(0 A f)   ; (comente no modo AC)
VS 1 0  AC 169.71 0   ; magnitude=169.71 V, fase=0°

* ===== Elementos =====
L1 1 2 77.8m
R1 2 3 6.2347
R2 3 0 25

E13 13 0  1 3  1
*---------------------------------------------------------------
* Parâmetros de simulação
*---------------------------------------------------------------

* Transiente: passo de impressão 0.1 ms, simular 5 períodos
*.tran 0.1ms {5*T}

*.ac: varrer apenas 60 Hz (descomente as duas linhas abaixo e comente a .tran)
*.ac lin 1 60 60
.ac lin 7 58 64

* * --- MEAS para AC a 60 Hz ---
.meas ac Vs_mag   FIND vm(1)    AT=60
.meas ac V1_mag   FIND vm(13)   AT=60
.meas ac V2_mag   FIND vm(3)    AT=60

.meas ac Vs_phase FIND vp(1)  AT=60
.meas ac V1_phase FIND vp(13) AT=60
.meas ac V2_phase FIND vp(3)  AT=60

.meas ac V1_phase_deg param='V1_phase*180/3.14'
.meas ac V2_phase_deg param='V2_phase*180/3.14'

* --- Módulos (magnitudes) ---
* .meas ac Vs_mag  FIND vm(1)    AT=60
* .meas ac V1_mag  FIND vm(13)   AT=60
* .meas ac V2_mag  FIND vm(3)    AT=60

* --- Módulos em dB (opcional) ---
* .meas ac Vs_db   FIND vdb(1)   AT=60
* .meas ac V1_db   FIND vdb(13)  AT=60
* .meas ac V2_db   FIND vdb(3)   AT=60

* --- Fases (graus) ---
*.meas ac Vs_phase_deg FIND par('180/PI*ph(v(1))')    AT=60
*.meas ac V1_phase_deg FIND par('180/PI*ph(v(1,3))')  AT=60
*.meas ac V2_phase_deg FIND par('180/PI*ph(v(3))')    AT=60

.control
  run
  * Para transiente:
  *plot v(1) v(2) v(3)

  *plot v(1,3)          ; tensão entre nó 1 e nó 3
  * Para análise AC (se usar .ac):
  * ac
  * plot vdb(1) vdb(2) vdb(3)
.endc

.end
