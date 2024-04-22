Exemplos da criação de vetores

.control
# criando vetor de reais de tamanho 5
let myvec = vector(5)
print myvec  ; imprime o vetor

let myvec[0][0] = (pi, pi) ; Too many dimensions given. Only 1 are present.
# A mensagem de erro "Too many dimensions given. Only 1
# are present." indica que você está tentando acessar um
# vetor ou matriz com mais dimensões do que ele realmente
# possui. Por exemplo, isso pode ocorrer se você tentar
# acessar um vetor como se fosse uma matriz de duas
# dimensões.

# myvec agora é uma variável complexa de tamanho uma unidade de dado.
let myvec = (pi, pi)
print myvec

# cria um vetor de tamanho 5 de complexos
let myvec = j(vector(5))
print myvec

let myvec[0][0] = (pi, pi) ; Too many dimensions given. Only 1 are present.
# o vetor é complexo, mas continua com uma única dimensão.

# de forma correta a primeira posição recebe o tipo de dado Complexo
let myvec[0] = (pi, pi)
print myvec

.endc

.end
