* Exemplo de netlist com fonte senoidal

.param T = {2*4*atan(1)}  $ 2PI
.param f = 1/T
.param A = 1              $ Aplitude

V1 1 GND sin(0 A f)
R1 1 GND 100

.save all
.tran {T/100} {T}

.control
    run
    meas tran x WHEN v(1)=0 CROSS=1
    meas tran y FIND v(1) AT=x
    meas tran y FIND v(1) AT=3.14
*	 echo $&y
*	 print y
*     meas tran x WHEN v(1)=y CROSS=1


.endc
.end


* meas tran x WHEN v(1)=0 CROSS=1
* meas tran y1 FIND v(1) AT=3.141563e+00
* meas tran y2 FIND v(1) AT=x
* let valor = abs(abs(y1)-abs(y2))
