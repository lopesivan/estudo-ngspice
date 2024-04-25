CARGA E DESCARGA DE CAPACITOR

.include ckt.cir
.include sim.cir

.control
    run
    wrdata output.csv n1 n2
 *    shell python plotter.py ckt.pdf
    quit
.endc

.end
