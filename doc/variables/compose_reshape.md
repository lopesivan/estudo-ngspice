

```{bash}
compose a values (0,0) (1,1) (2,2) (3,3)

print a

| index |  a     |
+-------+--------+
|  0    | 0, 0   |
|  1    | 1, 1   |
|  3    | 2, 2   |
|  4    | 3, 3   |
+-------+--------+


print a[1]
a[1] = 1 , 1


compose a values (0,0) (1,1) (2,2) (3,3) (4,4) (5,5)
|  0    | 0, 0   |
|  1    | 1, 1   |
|  3    | 2, 2   |
|  4    | 3, 3   |
|  5    | 4, 4   |
|  6    | 5, 5   |

reshape a [2][3]

        0    1    2
        |    |    |
        v    v    v
0 -> | 0,0  1,1  2,2 |
1 -> | 3,3  4,4  5,5 |

a[0][3] == 2,2
```