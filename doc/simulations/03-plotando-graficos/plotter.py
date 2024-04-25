import pandas as pd
import matplotlib.pyplot as plt
import sys

# Verificar se o nome do arquivo foi passado como argumento
if len(sys.argv) < 2:
    print("Uso: python plotter.py <nome_do_arquivo>.pdf")
    sys.exit(1)

filename = sys.argv[1]

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
greek_letterz = chr(964)
tau = "{}{}".format(3, greek_letterz)
plt.text(
    tau3_time, plt.ylim()[1] * 0.95, tau, horizontalalignment="right", color="green"
)
tau = "{}{}".format(5, greek_letterz)
plt.text(tau5_time, plt.ylim()[1] * 0.95, tau, horizontalalignment="right", color="red")

# Destacar o ponto específico (333, 67.8)
# Usa zorder para colocar o ponto acima das linhas
ponto = {"x": 60, "y": 20}
# plt.scatter(ponto["x"], ponto["y"], color="blue", s=100, edgecolor="black", zorder=5)
plt.scatter(ponto["x"], ponto["y"], color="red", s=10, edgecolor="black", zorder=5)
plt.annotate(
    "Ponto de Interseção ({},{})".format(ponto["x"], ponto["y"]),
    (ponto["x"], ponto["y"]),
    textcoords="offset points",
    xytext=(0, 10),
    ha="center",
)


plt.title("Tensão no Nó 1")
plt.xlabel("Tempo (s)")
plt.ylabel("Tensão (V)")
plt.legend()
plt.grid(True)

# Salvar o gráfico em PDF
plt.savefig(filename)
plt.close()  # Fechar a figura para liberar recursos
