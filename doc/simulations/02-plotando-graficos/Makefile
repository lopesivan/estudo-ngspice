CKT=01-ckt.sp

ckt: $(CKT)
	ngspice $(CKT) | tee $(CKT).out
	# ngspice -b $(CKT) | tee $(CKT).out

output.csv: ckt

plot: output.csv
	python plotter.py

clean:
	rm output.csv $(CKT).out
