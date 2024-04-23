* Exemplo de simulação de circuito RC com condição inicial usando UIC
V1 n1 0 5V
R1 n1 n2 1k
C1 n2 0 1uF IC=2V

* Configuração da análise transiente com UIC
.TRAN 1us 10ms UIC

* Configurações adicionais e comandos de plotagem
.control
run
plot V(n2)
.endc

.end

