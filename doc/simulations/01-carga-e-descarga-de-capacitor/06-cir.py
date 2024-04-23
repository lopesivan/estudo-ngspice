import pandas as pd
import matplotlib.pyplot as plt

# Carregar dados
data = pd.read_csv(
    "output.csv", delim_whitespace=True, header=None, names=["Time", "V1"]
)

# Plotar tensão
plt.figure(figsize=(10, 5))
plt.plot(data["Time"], data["V1"], label="V(1)")
plt.axvline(x=3.14, color="red", linestyle="--", label="t = 3.14s")
plt.title("Tensão no Nó 1")
plt.xlabel("Tempo (s)")
plt.ylabel("Tensão (V)")
plt.legend()
plt.grid(True)
plt.show()
