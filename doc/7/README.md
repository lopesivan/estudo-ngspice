# Análise de Ruído

A parte de análise de ruído do Ngspice fornece o ruído gerado
pelo dispositivo para um determinado circuito. Quando provido
com uma fonte de entrada e uma porta de saída, a análise calcula
as contribuições de ruído de cada dispositivo e cada gerador de
ruído dentro do dispositivo, para a tensão da porta de saída.
Isso também calcula o ruído de entrada equivalente do circuito,
com base no ruído de saída. Isso é feito para cada ponto de
freqüência em um intervalo especificado - o valor calculado do
ruído corresponde a a densidade espectral da variável do
circuito vista como um processo estoquês gaussiano
estacionário.  Depois de calcular as densidades espectrales, a
análise de ruído integra esses valores sobre as especificações.
Faixa de freqüência para chegar à tensão e corrente de ruído
total sobre esta faixa de freqüência.  Os valores calculados
correspondem à variância das variáveis de circuito
vistas como estacionárias Processos gaussianos.
