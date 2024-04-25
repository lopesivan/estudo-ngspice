CKT=ckt

$(CKT).out: $(CKT).sp
	ngspice $(CKT).sp | tee $(CKT).out

output.csv: $(CKT).out

plot: output.csv
	python plotter.py $(CKT).pdf

show:
	zathura $(CKT).pdf

clean:
	rm output.csv $(CKT).out $(CKT).pdf
