* SCIP STATISTICS
*   Problem name     : mknap_3
*   Variables        : 20 (20 binary, 0 integer, 0 implicit integer, 0 continuous)
*   Constraints      : 10
NAME          mknap_3
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
    x0        Obj                            100  c2                               3 
    x0        c3                               5  c1                               8 
    x0        c4                               5  c5                               5 
    x0        c0                               8  c7                               3 
    x0        c8                               3  c9                               3 
    x1        c5                              11  c1                              44 
    x1        c8                               6  c9                               8 
    x1        Obj                            220  c0                              24 
    x1        c7                               4  c2                               6 
    x1        c4                              11  c3                               9 
    x2        c8                               9  c7                               5 
    x2        c1                              13  c0                              13 
    x2        c9                               9  c2                               4 
    x2        c3                               6  c6                               1 
    x2        c4                               7  Obj                             90 
    x2        c5                               7 
    x3        c5                              55  c2                              20 
    x3        c6                              10  c4                              50 
    x3        c0                              80  c9                              35 
    x3        c1                             100  c7                              20 
    x3        c3                              40  Obj                            400 
    x3        c8                              30 
    x4        c3                              30  Obj                            300 
    x4        c1                             100  c4                              40 
    x4        c9                              29  c8                              29 
    x4        c2                              20  c5                              40 
    x4        c6                               4  c0                              70 
    x4        c7                              14 
    x5        c7                              20  c5                              40 
    x5        c6                              10  c0                              80 
    x5        c4                              40  c1                              90 
    x5        c8                              20  Obj                            400 
    x5        c3                              40  c2                              30 
    x5        c9                              20 
    x6        c5                              21  c8                              12 
    x6        c7                               6  c4                              19 
    x6        Obj                            205  c3                              16 
    x6        c1                              75  c2                               8 
    x6        c0                              45  c9                              16 
    x7        c9                              15  c4                               7 
    x7        c6                               6  c5                               9 
    x7        c1                              25  c0                              15 
    x7        Obj                            120  c2                               3 
    x7        c3                               5  c8                              12 
    x7        c7                              12 
    x8        c4                              18  c5                              18 
    x8        c1                              28  c2                              12 
    x8        c0                              28  c8                              10 
    x8        c3                              18  Obj                            160 
    x8        c9                              10  c7                              10 
    x9        c7                              18  c0                              90 
    x9        Obj                            580  c8                              30 
    x9        c6                               6  c3                              24 
    x9        c1                             120  c2                              14 
    x9        c4                              29  c9                              30 
    x9        c5                              29 
    x10       c6                              32  c1                             130 
    x10       c4                              70  c2                              40 
    x10       c8                              42  c9                              42 
    x10       Obj                            400  c7                              42 
    x10       c5                              70  c0                             130 
    x10       c3                              60 
    x11       c1                              32  c4                              21 
    x11       c8                              18  c5                              21 
    x11       Obj                            140  c7                               9 
    x11       c3                              16  c0                              32 
    x11       c2                               6  c9                              20 
    x11       c6                               3 
    x12       c0                              20  Obj                            100 
    x12       c5                              17  c9                              18 
    x12       c7                              12  c3                              11 
    x12       c8                              18  c1                              40 
    x12       c4                              17  c2                               3 
    x13       c5                              35  Obj                           1300 
    x13       c8                             110  c4                              30 
    x13       c3                              30  c0                             120 
    x13       c7                             100  c2                              20 
    x13       c6                              70  c9                             120 
    x13       c1                             160 
    x14       c2                               5  c9                              20 
    x14       c0                              40  c4                              25 
    x14       c8                              20  c6                              10 
    x14       Obj                            650  c3                              25 
    x14       c1                              40  c7                              20 
    x14       c5                              25 
    x15       c5                              20  c9                              20 
    x15       c7                               5  c8                              15 
    x15       c3                              10  c4                              15 
    x15       c1                              60  c0                              30 
    x15       Obj                            320 
    x16       c9                              22  c8                              18 
    x16       c7                               6  c4                              25 
    x16       c5                              25  Obj                            480 
    x16       c1                              55  c0                              20 
    x16       c3                              13  c2                               5 
    x17       Obj                             80  c3                               5 
    x17       c0                               6  c4                               5 
    x17       c5                               5  c8                               7 
    x17       c9                               7  c7                               4 
    x17       c2                               3  c1                              10 
    x18       c3                               1  c7                               1 
    x18       c0                               3  c9                               3 
    x18       c4                               1  c5                               2 
    x18       Obj                             60  c8                               2 
    x18       c1                               6 
    x19       c1                             240  c2                              20 
    x19       c0                             180  c8                              40 
    x19       c3                              80  c7                              20 
    x19       c4                             100  c5                             110 
    x19       Obj                           2550  c9                              50 
    INTEND    'MARKER'                            'INTEND'                           
RHS
    RHS       c0                             550  c1                             700 
    RHS       c2                             130  c3                             240 
    RHS       c4                             280  c5                             310 
    RHS       c6                             110  c7                             205 
    RHS       c8                             260  c9                             275 
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
ENDATA