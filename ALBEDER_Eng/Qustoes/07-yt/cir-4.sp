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
.csparam T  = T
.csparam Vs = Vs
.csparam V1 = V1
.csparam V2 = V2

.control
    run
    listing e
    echo "**************************************"
    echo "**************** SOL: ****************"
    echo "**************************************"
    echo ""

    echo  "T  =", $&T
    echo  "Vs =", $&Vs
    echo  "V1 =", $&V1
    echo  "V2 =", $&V2
    echo ""

    echo "**************************************"
    meas tran Vs_rms   RMS v(1)  from='4*T' to='5*T'
    meas tran V13_rms  RMS v(13) from='4*T' to='5*T'
    meas tran V2_rms   RMS v(3)  from='4*T' to='5*T'
    echo "**************** RMS: ****************"
    echo "Vs_rms  =", $&Vs_rms
    echo "V13_rms =", $&V13_rms
    echo "V2_rms  =", $&V2_rms
    echo ""

    echo "**************************************"
    meas tran Vs_pp   PP v(1)  from='4*T' to='5*T'
    meas tran V13_pp  PP v(13) from='4*T' to='5*T'
    meas tran V2_pp   PP v(3)  from='4*T' to='5*T'
    echo "**************** RMS: ****************"
    echo "Vs_pp  =", $&Vs_pp
    echo "V13_pp =", $&V13_pp
    echo "V2_pp  =", $&V2_pp
    echo ""

    let aVs_pp = {2*Vs}
    let aV1_pp = {2*V1}
    let aV2_pp = {2*V2}
    echo  "Vs_pp =", $&aVs_pp
    echo  "V1_pp =", $&aV1_pp
    echo  "V2_pp =", $&aV2_pp
    echo ""

    echo "**************************************"
    meas tran Vs_max   MAX v(1)  from='4*T' to='5*T'
    meas tran V13_max  MAX v(13) from='4*T' to='5*T'
    meas tran V2_max   MAX v(3)  from='4*T' to='5*T'
    echo "**************** RMS: ****************"
    echo "Vs_max  =", $&Vs_max
    echo "V13_max =", $&V13_max
    echo "V2_max  =", $&V2_max
    echo ""

*   mede os instantes do período (você já tem isso):
*   Aqui o resultado será `T_meas = t(RISE=2) – t(RISE=1)`.
    meas tran t_meas TRIG v(1) VAL=0 RISE=1  TARG v(1) VAL=0 RISE=2
    echo t_meas = $&t_meas

    meas tran t_meas TRIG v(1) VAL=0 RISE=3  TARG v(1) VAL=0 RISE=4
    echo t_meas = $&t_meas

*   Aqui o resultado será `T_meas = t(RISE=2) – t(RISE=1)`.
    meas tran t1 WHEN v(1)=0 RISE=1
    meas tran t2 WHEN v(1)=0 RISE=2

    echo t1 = $&t1
    echo t2 = $&t2
    let dt  = {t2-t1}
    echo dt = $&dt

	let dt   = minimum(vecd(time))
	let eps  = 3*dt               ; largura temporal muito pequena
	let ymin = minimum(v(1))
	let ymax = maximum(v(1))

    echo dt   = $&dt
    echo eps  = $&eps
	echo ymin = $&ymin
	echo ymax = $&ymax

.endc

.end
