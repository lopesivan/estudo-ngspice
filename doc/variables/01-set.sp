exemplo do uso de set para concatenar string

.control
set msg1 = "bom dia, "
set msg2 = "Ivan."
set msg = $msg1$msg2

echo $msg

set msg1 = "faro"
set msg2 = "fa"
set msg = ( $msg1 $msg2 )
echo $msg
* faro fa

set msg = ( $msg1$msg2 )
echo $msg
* farofa

    let msg2 = 65
set msg = ( $msg1 {$&msg2} )
echo $msg
* faro 65

set msg = ( $msg1{$&msg2} )
echo $msg
* faro65

set msg = $msg1{$&msg2}
echo $msg
* faro65
.endc
.end



