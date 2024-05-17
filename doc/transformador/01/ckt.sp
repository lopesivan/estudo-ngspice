Circuito com aplificador

* - O exemplo usa a seguinte linha de conexão:
*
*   ```
*             V-
*             |
*         in- |   ______________ out
*         |   |  /
*   XU1 3 2 7 4 6 LM741/NS
*       |   |
*       in+ |
*           |
*           V+
*
*   ```
*

.param f = 60                $ frequencia Hz
.param T = 1/f               $ período
.param A = 3                 $ Aplitude
.param positive_supply = 12  $ alimentação positiva
.param negative_supply = 12  $ alimentação negativa

.include LM741.MOD

R1    1   2  10k
R2    2   6  10k
R3    3   5  10k
R4    3   0  10k

RL    6   0  10k

Vp    7   0  {positive_supply}
Vm    0   4  {negative_supply}
V1    1   5  sin(0 A f)

.include LM741.MOD
XU1 3 2 7 4 6 LM741/NS

.tran {T/10} {2*T}

.control
    run
.endc

.end
