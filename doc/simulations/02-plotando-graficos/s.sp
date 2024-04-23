*** Emulate the .step command

*From Philips SC04 "Small signal transistors 1991"
* Base spreading parameters (RB,IRB,RBM) estimated. TR derived using BCY58 data
.model BC546B npn ( IS=7.59E-15 VAF=73.4 BF=480 IKF=0.0962 NE=1.2665
+ ISE=3.278E-15 IKR=0.03 ISC=2.00E-13 NC=1.2 NR=1 BR=5 RC=0.25 CJC=6.33E-12
+ FC=0.5 MJC=0.33 VJC=0.65 CJE=1.25E-11 MJE=0.55 VJE=0.65 TF=4.26E-10
+ ITF=0.6 VTF=3 XTF=20 RB=100 IRB=0.0001 RBM=10 RE=0.5 TR=1.50E-07)

.param ptemp = -55 R1 = 2k
.temp {ptemp}                      ; set the overall circuit temperature

V1 vcc 0 5                         ; the circuit
R1 vcc cc {R1}
Q1 cc bb 0 BC546B
R2 vcc bb 500k

.probe I(Q1)                       ; measure the Q1 terminal currents
.save all                          ; not only save the Q1 current values, but all node values

.op

.control
let index = 1                       ; new loop index vector (in plot 'const')
let tcur = 25                       ; new temperature vector (in plot 'const')
while tcur <= 125                   ; the temperature loop
  let mvaf = 50                     ; new model parameter vector (in plot 'const')
  while mvaf <= 300                 ; the VAF loop
    let rr1 = 2k                    ; new resistance parameter vector (in plot 'const')
    while rr1 <= 10k                ; the resistor R1 loop
      echo
      echo
      echo *** op no. $&index',' R1=$&rr1',' VAF=$&mvaf',' temp=$&tcur *** ; print to console where we are
      alterparam ptemp = $&tcur     ; change the temperature parameter
      alterparam R1 = $&rr1         ; change the R1 resistance parameter
      reset                         ; activate the parameter changes by reloading the ciruit
      altermod BC546B VAF = $&mvaf  ; change the VAF model parameter
      run                           ; run the op simulation
      print v(cc) v(bb) i(q1:c) i(q1:b) ; the data output, i(q1:c) is the same as q1:c#branch
      let rr1 = rr1 + 2k            ; new resistance value
      let index = index + 1
    end
    let mvaf = mvaf + 50            ; new VAF value
  end
  let tcur = tcur + 10              ; new temperature value
end
display
rusage
.endc

.end


