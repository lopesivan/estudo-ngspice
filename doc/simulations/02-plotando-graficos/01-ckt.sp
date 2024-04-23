* Exemplo de netlist com fonte senoidal

.param T = {2*4*atan(1)}  $ 2PI
.param f = 1/T
.param A = 1              $ Aplitude

V1    1 0  sin(0 A f)
R1    1 0  100

.tran {T/10} {T}

.control
    run
    meas tran x WHEN v(1)=0 CROSS=1
    meas tran Vmax MAX v(1) from=0 to=3.14
    meas tran Vpp PP v(1) from=0 to=3.14
    meas tran time_when_cross_first WHEN v(1) CROSS 0.5 RISE=1
*   wrdata output.csv v(1)
*   quit
.endc
.end
