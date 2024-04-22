```{bash}
>  ngspice 2943 -> let a = vector(5)
>  ngspice 2944 -> echo $&a
0 1 2 3 4
>  ngspice 2945 -> echo $a(2)
Error: a(2): no such variable.

>  ngspice 2946 -> echo $a{2}
Error: a: no such variable.
2
>  ngspice 2947 -> echo $a[2]
Error: a[2]: no such variable.

>  ngspice 2948 -> print a
                                Constant values
                                constants  Wed Dec 27 18:41:13 UTC 2023
--------------------------------------------------------------------------------
Index   a
--------------------------------------------------------------------------------
0       0.000000e+00
1       1.000000e+00
2       2.000000e+00
3       3.000000e+00
4       4.000000e+00
>  ngspice 2949 -> let a[3] = 76999
>  ngspice 2950 -> print a
                                Constant values
                                constants  Wed Dec 27 18:41:13 UTC 2023
--------------------------------------------------------------------------------
Index   a
--------------------------------------------------------------------------------
0       0.000000e+00
1       1.000000e+00
2       2.000000e+00
3       7.699900e+04
4       4.000000e+00
>  ngspice 2951 ->

```

