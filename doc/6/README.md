# Análise sensibilidade

O Ngspice calculará a sensibilidade do ponto de operação de CC
ou o sinal de sinal pequeno de CA de uma variável de saída em
relação a todas as variáveis de circuito, incluindo
os parâmetros do modelo.  Ngspice calcula a diferença em uma
variável de saída (uma tensão de nó ou uma corrente de
ramificação) perturbando cada parâmetro de cada dispositivo de
forma independente. Como o método é numérico aproximação, os
resultados podem demonstrar efeitos de segunda ordem em
parâmetros altamente sensíveis, ou pode deixar de mostrar
sensibilidade muito baixa, mas não zero. Além disso, uma vez que
cada variável é perturbada por uma pequena fração de seu valor,
os parâmetros de valor zero não são analisados (isso
tem o benefício de reduzindo o que geralmente é uma quantidade
muito grande de dados).
