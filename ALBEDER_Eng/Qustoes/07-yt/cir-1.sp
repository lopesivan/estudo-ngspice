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
VS 1 0  sin(0 A f)

* Para análise AC (pequeno sinal, fásor):
* (opcional; use APENAS quando for rodar .ac)
*VS 1 0 AC 120 0

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
.tran 0.1ms {5*T}

*.ac: varrer apenas 60 Hz (descomente as duas linhas abaixo e comente a .tran)
*.ac lin 1 60 60
*.print ac v(1) v(2) v(3)

* Assumindo que você já tem: .param T={1/f}
* --- Vs ---
.meas tran Vs_pp   PP   v(1)     from='4*T' to='5*T'
.meas tran Vs_rms  RMS  v(1)     from='4*T' to='5*T'
.meas tran Vs_max  MAX  v(1)     from='4*T' to='5*T'

* --- V1 = v(1,3) ---
.meas tran V13_pp   PP   v(13)   from='4*T' to='5*T'
.meas tran V13_rms  RMS  v(13)   from='4*T' to='5*T'
.meas tran V13_max  MAX  v(13)   from='4*T' to='5*T'

* --- V2 = v(3) ---
.meas tran V2_pp   PP   v(3)     from='4*T' to='5*T'
.meas tran V2_rms  RMS  v(3)     from='4*T' to='5*T'
.meas tran V2_max  MAX  v(3)     from='4*T' to='5*T'

* --- Período de Vs (opcional, confirma T a partir do sinal) ---
.meas tran T_meas TRIG v(1) VAL=0 RISE=1 TARG v(1) VAL=0 RISE=2

* --- Atraso de V1 em relação a Vs ---
.meas tran tdel_V1 TRIG v(1) VAL=0 RISE=1  TARG v(13) VAL=0 RISE=1
.meas tran phi_V1_deg param='-360*f*tdel_V1'

* --- Atraso de V2 em relação a Vs ---
.meas tran tdel_V2  TRIG v(1)    VAL=0 RISE=1  TARG v(3)   VAL=0 RISE=1
.meas tran phi_V2_deg param='-360*f*tdel_V2'

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
