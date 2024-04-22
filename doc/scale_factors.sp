Testando sufixos

.control
    set sufixos = ( 1T 1G 1Meg 1K 1mil 1m 1u 1n 1p 1f )
    foreach var $sufixos
	    set valor = "ii"$var
		echo $valor
        echo var is $var
        let a = $var
        echo $&a
        print a
    end
.endc

.end

