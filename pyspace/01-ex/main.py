from PySpice.Unit import *
from PySpice.Spice.Netlist import Circuit, SubCircuit, SubCircuitFactory
from PySpice.Spice.Library import SpiceLibrary
from PySpice.Probe.Plot import plot
from PySpice.Doc.ExampleTools import find_libraries
import PySpice.Logging.Logging as Logging
logger = Logging.setup_logging()


class Level2(SubCircuitFactory):
    NAME = 'level2'
    NODES = ('d4', 'g4', 'v4')

    def __init__(self):
        super().__init__()
        self.M(1, 'd4', 'g4', 'v4', 'v4', model='NMOS', w=1e-5, l=3.5e-7)


class Level1(SubCircuitFactory):
    NAME = 'level1'
    NODES = ('d3', 'g3', 'v3')

    def __init__(self):
        super().__init__()
        self.X('mos2', 'level2', 'd3', 'g3', 'v3')
        self.subcircuit(Level2())


circuit = Circuit('Transistor output characteristics')
circuit.V('dd', 'd1', circuit.gnd, 2)
circuit.V('ss', 'vsss', circuit.gnd, 0)
circuit.V('sig', 'g1', 'vsss', 0)
circuit.X('mos1', 'level1', 'd1', 'g1', 'vsss')

if True:
    circuit.subcircuit(Level1())
else:
    subcircuit_level2 = SubCircuit('level2', 'd4', 'g4', 'v4')
    subcircuit_level2.M(1, 'd4', 'g4', 'v4', 'v4',
                        model='NMOS', w=1e-5, l=3.5e-7)

    subcircuit_level1 = SubCircuit('level1', 'd3', 'g3', 'v3')
    subcircuit_level1.X('mos2', 'level2', 'd3', 'g3', 'v3')
    subcircuit_level1.subcircuit(subcircuit_level2)

    circuit.subcircuit(subcircuit_level1)

# circuit.model('NMOS', 'NMOS', LEVEL=8)
# modelo simples
circuit.model('NMOS', 'NMOS', LEVEL=1, VTO=0.7, KP=120e-6, LAMBDA=0.02)

# e na instância, opcionalmente informe áreas/perímetros p/ silenciar os avisos
# (valores de exemplo; ajuste conforme seu W/L)
# self.M(1, 'd4','g4','v4','v4', model='NMOS', w=1e-5, l=3.5e-7,
#        AD=1e-12, AS=1e-12, PD=4e-6, PS=4e-6)

print(str(circuit))


simulator = circuit.simulator(temperature=25, nominal_temperature=25)
analysis = simulator.dc(Vdd=slice(0, 5, .1))  # Fixme: ,Vsig=slice(1, 5, 1)
