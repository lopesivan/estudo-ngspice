Exemplo de operações com Complexos

.control

    define pol(m, deg) ( m * exp( j(deg*PI/180) ) )

    let Vs       = pol(169.71, 0)
    let V1       = pol(118.79, 34.792)
    let V2       = pol(98.995, -43.213)
    let ZR       = pol(25, 0)
    let Z_bobina = pol(30, 78.005)
    let Z_total  = pol(42.857, 43.213)
    let corrente = pol(3.9598, -43.213)

    print Vs
    print V1
    print V2
    print ZR
    print Z_bobina
    print Z_total
    print corrente

    let Vs       = (169.71, 0)
    let V1       = (97.557, 67.783)
    let V2       = (72.148, -67.783)
    let ZR       = (25,0)
    let Z_bobina = (6.2347, 29.3450)
    let Z_total  = (31.235, 29.345)
    let corrente = (2.8859, -2.7113)

    print Vs
    print V1
    print V2
    print ZR
    print Z_bobina
    print Z_total
    print corrente

*r = 3.353378e+184,-7.11672e+183
    let r = v1^v1
    print r
    print real(r)
    print imag(r)
    print mag(r)
    let p = {phase(r)*180/pi}
	echo "fase = ", $&p
.endc
.end
