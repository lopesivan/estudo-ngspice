# Análise de polo-zero

A porção de análise de pólo-zero de Ngspice calcula os pólos e /
ou zeros no pequeno sinal função de transferência de corrente
alternada. O programa primeiro calcula o ponto de operação DC e,
em seguida, determina os modelos linearizados de pequeno sinal
para todos os dispositivos não-lineares no circuito. Este
circuito é então usado para encontrar os pólos e os zeros da
função de transferência. Dois tipos de funções de transferência
são permitidos: uma da forma (tensão de saída) / (tensão de
entrada) e a outra da forma (saída tensão) / (corrente de
entrada). Esses dois tipos de funções de transferência cobrem
todos os casos e um pode encontre os pólos / zeros de funções
como impedância de entrada / saída e ganho de tensão. A entrada
e As portas de saída são especificadas como dois pares de nós. A
análise pole-zero funciona com resistores, capacitores,
indutores, fontes de controle linear, fontes independentes,
BJTs, MOSFETs, JFETs e diodos. As linhas de transmissão não são
suportadas. O método utilizado na análise é um sub- busca
numérica ideal. Para grandes circuitos, pode demorar um tempo
considerável ou não encontrar todos pólos e zeros. Para alguns
circuitos, o método torna-se "perdido" e encontra um número
excessivo de pólos ou zeros.
