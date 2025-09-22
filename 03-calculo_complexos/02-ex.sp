Exemplo de operações com Complexos

.control

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

	echo "=============="
	echo "Vs", $&Vs
	let r = Z_total*corrente
    print r
    print real(r)
    print imag(r)
    print mag(r)
    let p = {phase(r)*180/pi}
	echo "fase = ", $&p

	echo "=============="
	echo "I"
	print corrente
	let r = v2/zr
    print r
    print real(r)
    print imag(r)
    print mag(r)
    let p = {phase(r)*180/pi}
	echo "fase = ", $&p

	echo "=============="
	echo "I"
	print corrente
	let r = v1/Z_bobina
    print r
    print real(r)
    print imag(r)
    print mag(r)
    let p = {phase(r)*180/pi}
	echo "fase = ", $&p

	echo "=============="
	echo "Z_bobina"
	print Z_bobina
	let r = v1/corrente
    print r
    print real(r)
    print imag(r)
    print mag(r)
    let p = {phase(r)*180/pi}
	echo "fase = ", $&p
.endc
.end
