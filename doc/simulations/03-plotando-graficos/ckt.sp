CARGA E DESCARGA DE CAPACITOR

.param Vvalue  = 25V           ; tensão fornecida
.param Rvalue  = 1.2Meg        ; valor da resistência
.param Cvalue  = 20uF          ; valor da Capacitância
.param tau     = Rvalue*Cvalue

** dados:
* R  = 1.2 Mega ohms
* C  = 20 µF
* V0 = 25 V
*

** circuito:
*         1         2
* v_i(t) ---[ R ]---+---[ C ]--- GND
*                   |
*               v_out(t)
*

V0 n1 GND  PULSE(0 {Vvalue} 1u 1u 1u 1   1)
* V0 n1 GND  PULSE(0 {Vvalue} 0  1u 1u 1m 2m)
R1 n1  n2  {Rvalue}
C1 n2 GND  {Cvalue}

.tran {tau/1000} {5*tau}

.csparam tau3 = {3*tau}
.csparam tau5 = {5*tau}

.control
    run
*   plot n1 n2
    print tau3
    print tau5
    let a = (1- exp(-3))*100
    echo 3 tau correspondem a {$&tau3}s e $&a% carrgado
    let a = (1- exp(-5))*100
    echo 5 tau correspondem a {$&tau5}s e $&a% carrgado

    meas tran ytau3 FIND n2 AT=tau3
    meas tran ytau5 FIND n2 AT=tau5
    echo {$&ytau3}
    echo {$&ytau5}

    wrdata output.csv n1 n2
    shell python plotter.py ckt.pdf
    quit
.endc

.end
