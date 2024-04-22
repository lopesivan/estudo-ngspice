exemplo do uso de for

.control
*   let vccvalues = [1 2 3 4 5]  <- Não funciona
    set vccvalues = ( 1 2 3 4 5 )
    foreach var $vccvalues
        echo var is $var
    end
.endc

.end


