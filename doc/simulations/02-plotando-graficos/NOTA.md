compose a values `seq -s' ' 107`

devhelp diode

Listing\*: Print a listing of the current circuit
General Form:

listing [logical] [physical] [deck] [expand] [param]

If the logical argument is given, the listing is with
all continuation lines collapsed into one line, and if the
physical argument is given the lines are printed out as they
were found in the file. The default is logical. A deck listing
is just like the physical listing, except without the line
numbers it recreates the input file verbatim (except that it
does not preserve case). If the word expand is present, the
circuit is printed with all subcircuits expanded. The option
param allows to print all parameters and their actual values.
