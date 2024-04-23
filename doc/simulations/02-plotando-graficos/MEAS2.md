A função `meas` no ngspice é uma ferramenta poderosa para
realizar medições em dados de simulação. Aqui está uma
explicação detalhada sobre como usar o comando `meas`,
juntamente com a documentação em markdown para facilitar
a compreensão e referência futura.

## Medidas em Dados de Simulação (`meas`)

O comando `meas` é usado para extrair métricas específicas
dos dados de simulação, como DC, AC, análise transiente
(TRAN), e análise especial (SP). Este comando pode ser
inserido dentro da seção `.control ... .endc` para obter
funcionalidades adicionais.

### Forma Geral do Comando `meas`

```markdown
MEAS {DC|AC|TRAN|SP} result_name TRIG trig_variable VAL = value [TD = delay]
[CROSS =# | CROSS = LAST] [RISE =# | RISE = LAST] [FALL =# | FALL = LAST]
[TRIG AT = time] TARG targ_variable VAL = value [TD = delay]
[CROSS =# | CROSS = LAST] [RISE =# | RISE = LAST] [FALL =# | FALL = LAST]
[TRIG AT = time]
```

- **DC|AC|TRAN|SP**: Especifica o tipo de análise de simulação.
- **result_name**: Nome do resultado da medida.
- **TRIG** e **TARG**: Definem as variáveis de gatilho e alvo para a medição.
- **VAL = value**: Valor específico para a condição de gatilho ou alvo.
- **TD = delay**: Tempo de delay (opcional).
- **CROSS**: Número de cruzamentos do sinal.
- **RISE** e **FALL**: Especificam os eventos de subida e descida do sinal.
- **TRIG AT = time**: Momento específico para ativação.

### Uso de `meas` dentro da seção `.control`

Quando usado dentro do `.control`, o `meas` não apenas imprime
os resultados, mas também os armazena em um vetor que pode
ser utilizado em comandos subsequentes do script. Isso é
particularmente útil para automação e análises complexas
em scripts.

#### Substituição para `par('expression')`

Dentro da seção `.control`, a função `par('expression')`
não é suportada. Em vez disso, pode-se usar o comando `let`
para definir expressões:

```spice
let vdiff = v(n1) - v(n0)
meas tran vtest find vdiff at=0.04e-3
```

### Exemplos de Uso

1. **Medir a tensão máxima**:

   ```spice
   meas tran Vmax MAX v(2) from=0 to=1
   ```

2. **Medir quando a tensão no nó 2 cruza 0.5V pela primeira vez**:

   ```spice
   meas tran Tcross WHEN v(2)=0.5 CROSS=1
   ```

3. **Medir a tensão em um momento específico (usando `let`
   para substituição)**:
   ```spice
   let vtime = v(2)
   meas tran check_volt find vtime at=1ms
   ```

### Conclusão

O comando `meas` é uma ferramenta versátil que permite
análises detalhadas e customizadas dos resultados de
simulação no ngspice. Utilizando-o dentro da seção
`.control`, os usuários podem automatizar a coleta de dados
e manipular resultados de simulação de maneira eficiente,
o que é crucial para otimização e verificação de projetos
eletrônicos complexos.
