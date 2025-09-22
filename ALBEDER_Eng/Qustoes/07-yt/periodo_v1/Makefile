CKT = periodo

all: build

build: output.csv
plotter: $(CKT).pdf

output.csv:
	ngspice $(CKT).sp

$(CKT).pdf: output.csv
	PYENV_VERSION=spice python plotter.py $@

show: $(CKT).pdf
	zathura $(CKT).pdf
clean:
	rm output.csv
	rm $(CKT).pdf
