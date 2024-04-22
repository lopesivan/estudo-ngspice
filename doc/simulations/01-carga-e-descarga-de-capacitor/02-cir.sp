CARGA E DESCARGA DE CAPACITOR

.param Vvalue  = 25V           ; tensão fornecida
.param V0value = 4             ; carga no capacitor com a chave aberta
.param Rvalue  = 1.2Meg        ; valor da resistência
.param Cvalue  = 20uF          ; valor da Capacitância
.param tau     = Rvalue*Cvalue

** dados:
* R  = 1.2 Mega ohms
* C  = 20 µF
* V0 = 25 V
*

** circuito:
*
* v_i(t) ---[ R ]---+---[ C ]--- GND
*                   |
*               v_out(t)
*


V0 n1 GND  {Vvalue}
R1 n1  n2  {Rvalue}
C1 n2 GND  {Cvalue} IC={V0value}

* Configuração da análise transiente com UIC
.tran {tau/1000} {5*tau} UIC

.control
    run
    plot n2
.endc

.end
