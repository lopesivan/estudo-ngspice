exemplo do uso de for

.control
    set mriaverdeyvariable = ( 1 2 3 4 5 6 7 8 9 )
    foreach var $mriaverdeyvariable
        echo var is $var
        let a = $var
        * let b = 2*a
        let b = 2*$var
        echo $&b
    end
.endc

.end
