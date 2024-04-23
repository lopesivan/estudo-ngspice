* Exemplo de netlist com fonte senoidal

.param T = {2*4*atan(1)}  $ 2PI
.param f = 1/T
.param A = 1              $ Aplitude

V1    1 0  sin(0 A f)
R1    1 0  100

.tran {T/10} {T}

.control
    run
    wrdata output.csv v(1)
    quit

* ----------------------------------------------------------------------------
* No. of Data Rows : 59
* > ngspice 3131 -> meas tran vmax MAX v(1)
* vmax                =  9.996179e-01 at=  1.543150e+00
* > ngspice 3132 -> meas tran vavg avg v(1)
* vavg                =  1.405884e-06 from=  0.000000e+00 to=  6.283185e+00
* > ngspice 3133 -> print sqrt(2)
* sqrt(2) = 1.414214e+00
* > ngspice 3134 -> meas tran Tcross WHEN v(1)=0 CROSS=1
* Tcross              =  3.141563e+00
* > ngspice 3135 -> meas tran Tcross WHEN v(1)=0 CROSS=2
*
* Error: measure  Tcross  WHEN(WHEN) : out of interval
*  meas tran Tcross WHEN v(1)=0 CROSS=2 failed!
.endc
.end
