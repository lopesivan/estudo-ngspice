Aqui está uma tabela em Markdown resumindo as funções disponíveis no ngspice, conforme descrito no texto. Esta tabela categoriza as funções baseadas em suas descrições, facilitando o entendimento e a referência.

### Tabela de Funções do ngspice

| Nome                  | Descrição                                                                                                   |
| --------------------- | ----------------------------------------------------------------------------------------------------------- |
| `mag(vector)`         | Magnitude do vetor (o mesmo que `abs(vector)`).                                                             |
| `ph(vector)`          | Fase do vetor.                                                                                              |
| `cph(vector)`         | Fase do vetor com valores contínuos, sem descontinuidade em ±π.                                             |
| `unwrap(vector)`      | Fase do vetor com valores contínuos em graus, sem descontinuidade em ±π.                                    |
| `j(vector)`           | Multiplica `i(sqrt(-1))` pelo vetor.                                                                        |
| `real(vector)`        | Componente real do vetor.                                                                                   |
| `imag(vector)`        | Parte imaginária do vetor.                                                                                  |
| `db(vector)`          | 20 \* log10(mag(vector)).                                                                                   |
| `log10(vector)`       | Logaritmo base 10 do vetor.                                                                                 |
| `ln(vector)`          | Logaritmo natural (base e) do vetor.                                                                        |
| `exp(vector)`         | e elevado à potência do vetor.                                                                              |
| `abs(vector)`         | Valor absoluto do vetor (o mesmo que `mag`).                                                                |
| `sqrt(vector)`        | Raiz quadrada do vetor.                                                                                     |
| `sin(vector)`         | Seno do vetor.                                                                                              |
| `cos(vector)`         | Cosseno do vetor.                                                                                           |
| `tan(vector)`         | Tangente do vetor.                                                                                          |
| `atan(vector)`        | Arcotangente do vetor.                                                                                      |
| `sinh(vector)`        | Seno hiperbólico do vetor.                                                                                  |
| `cosh(vector)`        | Cosseno hiperbólico do vetor.                                                                               |
| `tanh(vector)`        | Tangente hiperbólica do vetor.                                                                              |
| `floor(vector)`       | Maior inteiro menor ou igual ao vetor.                                                                      |
| `ceil(vector)`        | Menor inteiro maior ou igual ao vetor.                                                                      |
| `norm(vector)`        | Normaliza o vetor para 1 (o maior componente tem magnitude 1).                                              |
| `mean(vector)`        | Média dos elementos do vetor (resulta em um escalar).                                                       |
| `avg(vector)`         | Média acumulativa dos elementos do vetor.                                                                   |
| `stddev(vector)`      | Desvio padrão dos elementos do vetor.                                                                       |
| `group_delay(vector)` | Calcula o atraso de grupo −dphase[rad]/dω[rad/s].                                                           |
| `vector(number)`      | Cria um vetor de tamanho `number`, com elementos de 0 a `number - 1`.                                       |
| `unitvec(number)`     | Cria um vetor unitário de tamanho `number`.                                                                 |
| `length(vector)`      | Retorna o comprimento do vetor.                                                                             |
| `interpolate(vector)` | Interpola o vetor nomeado na escala do plot atual. Usa a variável `polydegree` para o grau de interpolação. |
| `deriv(vector)`       | Calcula a derivada do vetor.                                                                                |
| `vecd(vector)`        | Calcula o diferencial do vetor.                                                                             |
| `vecmin(vector)`      | Retorna o valor mínimo do vetor.                                                                            |
| `minimum(vector)`     | Retorna o valor mínimo do vetor.                                                                            |
| `vecmax(vector)`      | Retorna o valor máximo do vetor.                                                                            |
| `maximum(vector)`     | Retorna o valor máximo do vetor.                                                                            |
| `fft(vector)`         | Transformada rápida de Fourier (FFT).                                                                       |
| `ifft(vector)`        | Transformada inversa rápida de Fourier (IFFT).                                                              |
| `sortorder(vector)`   | Retorna um vetor com as posições dos elementos de um vetor real após serem ordenados.                       |
| `timer(vector)`       | Retorna o tempo de CPU menos o valor do primeiro elemento do vetor.                                         |
| `clock(vector)`       | Retorna o tempo real menos o valor do primeiro elemento do vetor.                                           |
| `rnd(vector)`         | Retorna um vetor com cada componente sendo um inteiro aleatório entre 0 e o valor absoluto do elemento.     |
| `sgauss(vector)`      | Retorna um vetor de números aleatórios de uma distribuição Gaussiana (média=0, desvio padrão=1).            |
| `sunif(vector)`       | Retorna um vetor de números reais aleatórios uniformemente distribuídos no intervalo [-1, 1[.               |
| `poisson(vector)`     | Retorna um vetor com elementos inteiros de uma distribuição de Poisson.                                     |
| `exponential(vector)` | Retorna um vetor com elementos de uma distribuição exponencial.                                             |

Esta tabela cobre uma variedade de funções úteis para
a manipulação e análise de dados em vetores dentro do
ngspice, oferecendo desde operações matemáticas básicas
até funções estatísticas e de processamento de sinais
mais complexas.

https://nmg.gitlab.io/ngspice-manual/interactiveinterpreter/expressions,functions,andconstants.html
