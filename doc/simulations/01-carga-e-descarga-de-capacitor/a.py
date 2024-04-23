import pandas as pd
import matplotlib.pyplot as plt

# Carregar dados
data = pd.read_csv(
    "output.csv",
    delim_whitespace=True,
    header=None,
    names=["tempo1", "V1", "tempo2", "V2"],
)

# Plotar tensão
plt.figure(figsize=(10, 5))
plt.plot(data["tempo1"], data["V1"], label="Pulse")
plt.plot(data["tempo2"], data["V2"], label="V(1)")

# Desenhar linhas verticais para os tempos de 3 tau e 5 tau
tau3_time = 7.200000e01  # 3 tau correspondem a 72s
tau5_time = 1.200000e02  # 5 tau correspondem a 120s

plt.axvline(x=tau3_time, color="green", linestyle="--", label="95.0213% carregado")
plt.axvline(x=tau5_time, color="red", linestyle="--", label="99.3262% carregado")

# Adicionar anotações com a letra grega tau
plt.text(
    tau3_time, plt.ylim()[1] * 0.95, "3 τ", horizontalalignment="right", color="green"
)
plt.text(
    tau5_time, plt.ylim()[1] * 0.95, "5 τ", horizontalalignment="right", color="red"
)

plt.title("Tensão no Nó 1")
plt.xlabel("Tempo (s)")
plt.ylabel("Tensão (V)")
plt.legend()
plt.grid(True)

# Salvar o gráfico em PDF
plt.savefig("tensao_no_n1.pdf")
plt.close()  # Fechar a figura para liberar recursos
