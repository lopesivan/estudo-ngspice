# Análise CC

A parte de análise de CC do ngspice determina o ponto de
operação do circuito elétrico com indutores em curto e
capacitores abertos. As opções de análise CC são especificadas
no .DC, .TF e .OP linhas de controle.

Assume-se que não há dependência de tempo em nenhuma das fontes
dentro da descrição do sistema.

O algoritmo do simulador subdivide o circuito nas porções que
exigem o algoritmo do simulador analógico e que exigem o
algoritmo gerado por eventos. Cada bloco do subsistema é então
iterado para solução, com as interfaces entre nós analógicos e
Nó conduzido por eventos iterado para consistência em todo o
sistema.

Uma vez obtidos valores estáveis para todos os nós no sistema, a
análise pára e os resultados pode ser exibido ou impresso
enquanto você os solicita.

Uma análise CC é realizada automaticamente antes de uma análise
transitória para determinar o transiente condições iniciais e
antes de uma análise de pequeno sinal de CA para determinar o
linearizado, modelos de sinal para dispositivos não-lineares. Se
solicitado, o valor de sinal pequeno dc de uma função de
transferência (proporção de variável de saída para fonte de
entrada), resistência de entrada e resistência de saída também é
calculada como parte da solução dc. A análise de CC também pode
ser usada para gerar curvas de transferência de DC: a A tensão
independente especificada, a fonte de corrente, o resistor ou a
temperatura são escalonados em um intervalo especificado pelo
usuário e as variáveis de saída do dc são
armazenadas para cada valor de fonte seqüencial.

