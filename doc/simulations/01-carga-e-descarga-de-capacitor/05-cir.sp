CARGA E DESCARGA DE CAPACITOR

.param Vvalue  = 25V           ; tensão fornecida
.param Rvalue  = 1.2Meg        ; valor da resistência
.param Cvalue  = 20uF          ; valor da Capacitância
.param tau     = Rvalue*Cvalue
.param tstep   = {tau/100}     ; time step
.param tstop   = {5*tau}       ; time stop

** dados:
* R  = 1.2 Mega ohms
* C  = 20 µF
* V0 = 25 V
*

** PWL:
*
*     V(t)[V]
*       ^
*    M  |             .------------.-
*       |            /|
*       |           / |
*       |          /  |     PWL (0 0 T1 0 T2 M T3 M)
*       |         /   |
*       .--------.----.------------.---->
*       0        T1   T2           T3   t[ms]
*

** circuito:
*         1         2
* v_i(t) ---[ R ]---+---[ C ]--- GND
*                   |
*               v_out(t)
*

*          PWL(0 0 T1      0 T2         M        T3      M)
V0 n1 GND  PWL(0 0 {tstep} 0 {40*tstep} {Vvalue} {tstop} {Vvalue})
R1 n1  n2  {Rvalue}
C1 n2 GND  {Cvalue}

.tran {tstep} {tstop}

.control
    run
    plot n1 n2
.endc

.end
