CARGA E DESCARGA DE CAPACITOR

.include ckt.cir
.include sim.cir

.csparam tau3 = {3*tau}
.csparam tau5 = {5*tau}

.control
    run
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
.endc

.end
