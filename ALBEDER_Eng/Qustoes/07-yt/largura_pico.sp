Questao #07

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


.control
    run
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
    let dt = {t2-t1}
    echo dt = $&dt

.endc

.end
