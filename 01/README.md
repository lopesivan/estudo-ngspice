# Curva característica do transistor bipolar


Para um transistor bipolar, como se constroe uma curva
característica de saída ou de coletor para um transistor
amplificador em base comum:

A curva característica de saída ou de coletor de um transistor
bipolar em amplificador de base comum pode ser construída
experimentalmente ao medir as relações entre a corrente de
coletor (IC) e a tensão de coletor (VC) para diferentes valores
de corrente de base (IB) em um circuito.

Para construir a curva característica de saída, siga os
seguintes passos:

1. Conecte o transistor bipolar em um circuito amplificador de
   base comum. O emissor (E), a base (B) e o coletor (C) do
   transistor devem ser conectados corretamente ao circuito, de
   acordo com o datasheet do transistor ou o esquema de conexão
   específico.

2. Conecte uma fonte de tensão variável à base do transistor e
   ajuste a tensão para diferentes valores desejados de corrente
   de base. Mantenha a tensão de emissor constante.

3. Meça a corrente de coletor e a tensão de coletor
   correspondentes para cada valor de corrente de base. Você
   pode usar um amperímetro para medir a corrente de coletor e um
   voltímetro para medir a tensão de coletor.

4. Anote os valores medidos de IC e VC para cada ponto na curva.

5. Repita os passos 2 a 4 para diferentes valores de corrente de
   base, cobrindo uma faixa adequada para a construção da curva
   característica.

6. Plotar um gráfico com a corrente de coletor (IC) no eixo
   vertical e a tensão de coletor (VC) no eixo horizontal,
   usando os valores medidos em cada ponto.

Ao conectar os pontos no gráfico, você obterá a curva
característica de saída do transistor bipolar em amplificador de
base comum. Essa curva mostra como a corrente de coletor varia
em relação à tensão de coletor para diferentes valores de
corrente de base, fornecendo informações sobre o comportamento
do transistor na amplificação de sinais.

## Para construir a curva característica de saída de um transistor bipolar em amplificador de base comum usando o software de simulação NGSpice, siga as etapas abaixo:

1. Abra o software NGSpice em seu computador e crie um novo
   arquivo de circuito.

2. Defina o modelo do transistor bipolar que você deseja usar.
   Você precisará fornecer informações sobre o transistor, como
seu número de modelo, parâmetros de ganho e capacitâncias. Por
exemplo, para um transistor NPN 2N3904, você pode usar o
seguinte comando no início do seu arquivo de circuito para
definir o modelo:

```
.model NPN NPN(IS=2E-14 BF=100 VAF=100 IKF=0.03)
```

3. Construa o circuito amplificador de base comum no NGSpice,
   conectando o transistor, resistores e uma fonte de tensão
   como mostrado no exemplo abaixo:

```
* Configuração do amplificador de base comum
Q1 NPN 0 2 1
R1 1 2 1k
RC 3 2 2k
RE 1 0 500
VCC 3 0 10
.model NPN NPN(IS=2E-14 BF=100 VAF=100 IKF=0.03)

* Análise DC
.op

.end
```

Nesse exemplo, o transistor NPN é representado como Q1, os
resistores são R1, RC e RE, e a fonte de tensão é VCC.
Certifique-se de ajustar os valores dos componentes para atender
às suas necessidades.

4. Execute a simulação para obter os resultados. No NGSpice,
   você pode executar a simulação do arquivo de circuito usando
o comando "source" seguido do nome do arquivo. Por exemplo:

```
source nome_do_arquivo.cir
```

Após a conclusão da simulação, o NGSpice gerará os resultados
para o circuito, incluindo as correntes e tensões nos diferentes
pontos do circuito.

5. Use os resultados da simulação para construir a curva
   característica de saída. Com base nos resultados da
   simulação, você pode plotar um gráfico da corrente de coletor
   (IC) em relação à tensão de coletor (VC) para diferentes valores
   de corrente de base (IB), utilizando uma ferramenta de plotagem
   gráfica como o Gnuplot ou o XycePlot.

Essas são as etapas básicas para construir a curva
característica de saída de um transistor bipolar em amplificador
de base comum usando o NGSpice. Lembre-se de ajustar os
componentes e os parâmetros do transistor conforme necessário
para seu circuito específico.
