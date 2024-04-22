# Análise de distorção

A porção de análise de distorção da Ngspice calcula a harmonia e
a intermodulação no estado estacionário produtos para pequenas
magnitudes de sinal de entrada. Se os sinais de uma única
freqüência forem especificados como entrada no circuito, os
valores complexos do segundo e terceiro harmônicos são
determinados em todos os pontos do circuito. Se houver sinais de
duas freqüências de entrada para o circuito, a análise descobre
os valores complexos das variáveis do circuito na
soma e diferença da entrada freqüências e na diferença da menor
freqüência da segunda harmônica do maior freqüência. A análise
de distorção é suportada para os seguintes dispositivos
não-lineares:

• Diodes (DIO),
• BJT,
• JFET (level 1),
• MOSFETs (levels 1, 2, 3, 9, and BSIM1),
• MESFET (level 1).

Todos os dispositivos lineares são suportados automaticamente
pela análise de distorção. Se houver interruptores presente no
circuito, a análise continua a ser precisa desde que os
interruptores não mudem sob as pequenas excitações usadas para
cálculos de distorção.  Se um modelo de dispositivo não suportar
a análise direta de distorção de sinal pequeno, use o Fourier de
declarações de FFT e avaliar a saída por script.

