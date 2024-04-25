CKT=netlist

$(CKT).out: $(CKT).sp
	ngspice $(CKT).sp | tee $(CKT).out

utput.csv: plotter.sp
	ngspice -b plotter.sp

plot: output.csv
	python plotter.py $(CKT).pdf

$(CKT).pdf: output.csv

show: $(CKT).pdf
	zathura $(CKT).pdf

cli: cli.sp
	ngspice cli.sp | tee cli.out

clean:
	rm output.csv $(CKT).out $(CKT).pdf cli.out

# eof
