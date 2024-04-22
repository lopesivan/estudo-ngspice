exemplo do uso de for

.control
    foreach var -40 -20 0 20k 40k
        echo var is $var
        let a = $var
        print a
    end
.endc

.end
