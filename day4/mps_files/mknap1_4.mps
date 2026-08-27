* SCIP STATISTICS
*   Problem name     : mknap_4
*   Variables        : 28 (28 binary, 0 integer, 0 implicit integer, 0 continuous)
*   Constraints      : 10
NAME          mknap_4
OBJSENSE
  MAX
ROWS
 N  Obj 
 L  c0 
 L  c1 
 L  c2 
 L  c3 
 L  c4 
 L  c5 
 L  c6 
 L  c7 
 L  c8 
 L  c9 
COLUMNS
    INTSTART  'MARKER'                            'INTORG'                           
    x0        Obj                            100  c3                               5 
    x0        c4                               5  c2                               3 
    x0        c5                               5  c1                               8 
    x0        c7                               3  c8                               3 
    x0        c0                               8  c9                               3 
    x1        c1                              44  Obj                            220 
    x1        c3                               9  c9                               8 
    x1        c2                               6  c4                              11 
    x1        c5                              11  c8                               6 
    x1        c0                              24  c7                               4 
    x2        c9                               9  c2                               4 
    x2        c5                               7  c3                               6 
    x2        Obj                             90  c4                               7 
    x2        c7                               5  c8                               9 
    x2        c1                              13  c6                               1 
    x2        c0                              13 
    x3        c0                              80  c9                              35 
    x3        c5                              55  Obj                            400 
    x3        c3                              40  c8                              30 
    x3        c4                              50  c6                              10 
    x3        c7                              20  c1                             100 
    x3        c2                              20 
    x4        Obj                            300  c4                              40 
    x4        c0                              70  c1                             100 
    x4        c5                              40  c9                              29 
    x4        c3                              30  c8                              29 
    x4        c7                              14  c2                              20 
    x4        c6                               4 
    x5        c6                              10  c2                              30 
    x5        c8                              20  Obj                            400 
    x5        c4                              40  c0                              80 
    x5        c7                              20  c5                              40 
    x5        c1                              90  c9                              20 
    x5        c3                              40 
    x6        Obj                            205  c8                              12 
    x6        c7                               6  c1                              75 
    x6        c2                               8  c5                              21 
    x6        c3                              16  c9                              16 
    x6        c0                              45  c4                              19 
    x7        c5                               9  c8                              12 
    x7        c9                              15  c0                              15 
    x7        c4                               7  c3                               5 
    x7        c7                              12  c1                              25 
    x7        Obj                            120  c6                               6 
    x7        c2                               3 
    x8        c8                              10  c5                              18 
    x8        c4                              18  c0                              28 
    x8        c1                              28  Obj                            160 
    x8        c9                              10  c2                              12 
    x8        c3                              18  c7                              10 
    x9        c7                              18  c3                              24 
    x9        c2                              14  c6                               6 
    x9        c9                              30  Obj                            580 
    x9        c0                              90  c8                              30 
    x9        c1                             120  c5                              29 
    x9        c4                              29 
    x10       c4                              70  Obj                            400 
    x10       c9                              42  c1                             130 
    x10       c5                              70  c2                              40 
    x10       c8                              42  c0                             130 
    x10       c6                              32  c7                              42 
    x10       c3                              60 
    x11       c4                              21  c1                              32 
    x11       c5                              21  c6                               3 
    x11       Obj                            140  c9                              20 
    x11       c3                              16  c0                              32 
    x11       c2                               6  c8                              18 
    x11       c7                               9 
    x12       c4                              17  c7                              12 
    x12       c9                              18  c1                              40 
    x12       c0                              20  c8                              18 
    x12       c2                               3  c3                              11 
    x12       Obj                            100  c5                              17 
    x13       c1                             160  c6                              70 
    x13       Obj                           1300  c9                             120 
    x13       c8                             110  c0                             120 
    x13       c5                              35  c3                              30 
    x13       c2                              20  c7                             100 
    x13       c4                              30 
    x14       c4                              25  c5                              25 
    x14       c2                               5  c6                              10 
    x14       c9                              20  c8                              20 
    x14       c3                              25  c0                              40 
    x14       c1                              40  Obj                            650 
    x14       c7                              20 
    x15       c9                              20  Obj                            320 
    x15       c7                               5  c3                              10 
    x15       c8                              15  c4                              15 
    x15       c0                              30  c1                              60 
    x15       c5                              20 
    x16       c2                               5  c3                              13 
    x16       c1                              55  c7                               6 
    x16       Obj                            480  c4                              25 
    x16       c8                              18  c9                              22 
    x16       c5                              25  c0                              20 
    x17       c7                               4  c5                               5 
    x17       c2                               3  c8                               7 
    x17       c0                               6  c3                               5 
    x17       c4                               5  c9                               7 
    x17       Obj                             80  c1                              10 
    x18       c7                               1  c5                               2 
    x18       c3                               1  c9                               3 
    x18       c0                               3  c4                               1 
    x18       c8                               2  c1                               6 
    x18       Obj                             60 
    x19       Obj                           2550  c1                             240 
    x19       c9                              50  c7                              20 
    x19       c4                             100  c3                              80 
    x19       c0                             180  c8                              40 
    x19       c2                              20  c5                             110 
    x20       c0                             220  c8                              60 
    x20       c3                              60  c6                              30 
    x20       Obj                           3100  c5                              70 
    x20       c1                             290  c4                              70 
    x20       c2                              30  c9                              60 
    x20       c7                              50 
    x21       c0                              50  c3                              50 
    x21       c6                              10  c9                              55 
    x21       Obj                           1100  c5                              55 
    x21       c1                              80  c4                              55 
    x21       c2                              40  c7                              30 
    x21       c8                              50 
    x22       c2                              10  c7                               5 
    x22       c3                              20  c0                              30 
    x22       c9                              25  c5                              20 
    x22       Obj                            950  c1                              90 
    x22       c8                              25  c4                              20 
    x23       c9                              30  c0                              50 
    x23       c6                              10  c3                              30 
    x23       c8                              25  c5                              50 
    x23       Obj                            450  c1                              70 
    x23       c4                              50  c7                              20 
    x24       Obj                            300  c0                              12 
    x24       c4                              15  c7                              20 
    x24       c8                              25  c6                              10 
    x24       c3                              10  c5                              20 
    x24       c9                              25  c1                              27 
    x24       c2                               5 
    x25       Obj                            220  c6                               5 
    x25       c4                              15  c7                              10 
    x25       c1                              17  c8                              15 
    x25       c3                               5  c0                               5 
    x25       c9                              15  c5                              15 
    x26       c7                              10  c8                              10 
    x26       Obj                            200  c1                               8 
    x26       c5                               6  c3                               3 
    x26       c0                               8  c9                              10 
    x26       c4                               6 
    x27       c7                              20  c5                              20 
    x27       c8                              28  c6                              10 
    x27       Obj                            520  c1                              28 
    x27       c3                              20  c4                              20 
    x27       c2                              10  c0                              18 
    x27       c9                              28 
    INTEND    'MARKER'                            'INTEND'                           
RHS
    RHS       c0                             930  c1                            1210 
    RHS       c2                             272  c3                             462 
    RHS       c4                             532  c5                             572 
    RHS       c6                             240  c7                             400 
    RHS       c8                             470  c9                             490 
BOUNDS
 BV Bound     x0                                 
 BV Bound     x1                                 
 BV Bound     x2                                 
 BV Bound     x3                                 
 BV Bound     x4                                 
 BV Bound     x5                                 
 BV Bound     x6                                 
 BV Bound     x7                                 
 BV Bound     x8                                 
 BV Bound     x9                                 
 BV Bound     x10                                
 BV Bound     x11                                
 BV Bound     x12                                
 BV Bound     x13                                
 BV Bound     x14                                
 BV Bound     x15                                
 BV Bound     x16                                
 BV Bound     x17                                
 BV Bound     x18                                
 BV Bound     x19                                
 BV Bound     x20                                
 BV Bound     x21                                
 BV Bound     x22                                
 BV Bound     x23                                
 BV Bound     x24                                
 BV Bound     x25                                
 BV Bound     x26                                
 BV Bound     x27                                
ENDATA