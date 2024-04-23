* Exemplo de netlist com fonte senoidal

.param T = {2*4*atan(1)}  $ 2PI
.param f = 1/T
.param A = 1              $ Aplitude

V1    1 0  sin(0 A f)
R1    1 0  100

.tran {T/10} {2*T}

.control
    run
    meas tran vmax MAX v(1)
    meas tran vavg avg v(1)
    print sqrt(2)
    meas tran Tcross WHEN v(1)=0 CROSS=1
    meas tran Tcross WHEN v(1)=0 CROSS=2

    quit
.endc
.end
