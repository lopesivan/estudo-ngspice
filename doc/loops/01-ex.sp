automatically assembling multiple vectors for printing

* A simple example for automatically assembling multiple vectors
* for plotting, printing, wrdata-ing:

.control
* string variable
set mywrdata = str0

* first vector
let str0 = vector(3)
let ii = 0

repeat 4
  let ii = ii + 1
  * Add name of the new vector to the list
  set mywrdata = ( $mywrdata str{$&ii} )
  * create this new vector
  let str{$&ii} = vector(3) + ii * 10
end

print $mywrdata
.endc

.end