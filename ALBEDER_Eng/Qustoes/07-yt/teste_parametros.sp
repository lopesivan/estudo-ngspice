* test csparam
.param TEMPS = 27
.csparam newt = {3*TEMPS}
.csparam mytemp = '2 + TEMPS'

.control
	echo $&newt $&mytemp          $ 81 29
	echo {$&newt/2}               $ 81/2
	echo {$&newt/2} {$&newt/3}    $ 81/2 81/2
	let new_var = {$&newt/3}      $ new_var = 2.700000e+01
	print new_var                 $ 2.700000e+01
.endc
.end

