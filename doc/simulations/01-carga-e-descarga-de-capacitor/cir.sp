CARGA E DESCARGA DE CAPACITOR

.param Rvalue = 1.2Meg          ; Passo de Cálculo
.param Cvalue = 20uF            ; Passo de Cálculo
.param tau    = Rvalue*Cvalue   ; Passo de Cálculo

** dados:
* R  = 1.2 Mega ohms
* C  = 20 µF
* V0 = 25 V

** circuito

V0 n1 0  25V
R1 n1 n2 1.2Meg
C1 n2 0  20uF

.ic v(n2) = 0             ; condições inicias
.tran {tau/1000} {5*tau}

.control
    run
    plot n2
.endc

.end
