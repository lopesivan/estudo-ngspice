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
    names=["tempo1", "V1", "tempo2", "t1", "tempo3", "t2"],
)

# Plotar tensão
plt.figure(figsize=(10, 5))
plt.plot(data["tempo1"], data["V1"], label="V(1)")

# Extrair os valores constantes t1 e t2 (primeira linha já basta)
t1 = data["t1"].iloc[0]
t2 = data["t2"].iloc[0]

xcoords = [t1, t2]
labels = ["t1", "t2"]
colors = ["red", "green"]

for xc, lbl, col in zip(xcoords, labels, colors):
    plt.axvline(x=xc, color=col, linestyle="--", label=f"{lbl} = {xc}")

# Linhas verticais em t1 e t2
# plt.axvline(x=t1, color="red", linestyle="--", label=f"t1 = {t1}")
# plt.axvline(x=t2, color="green", linestyle="--", label=f"t2 = {t2}")

plt.title("MEDINDO PERÍODO DE UMA ONDA")
plt.xlabel("Tempo (s)")
plt.ylabel("Tensão (V)")
plt.legend()
plt.grid(True)

# Salvar o gráfico em PDF
plt.savefig(filename)
plt.close()
