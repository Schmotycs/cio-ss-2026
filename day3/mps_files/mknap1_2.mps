* SCIP STATISTICS
*   Problem name     : mknap_2
*   Variables        : 15 (15 binary, 0 integer, 0 implicit integer, 0 continuous)
*   Constraints      : 10
NAME          mknap_2
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
    x0        c7                               3  c9                               3 
    x0        c0                               8  c8                               3 
    x1        c8                               6  c1                              44 
    x1        Obj                            220  c4                              11 
    x1        c7                               4  c2                               6 
    x1        c0                              24  c3                               9 
    x1        c9                               8  c5                              11 
    x2        c7                               5  Obj                             90 
    x2        c6                               1  c0                              13 
    x2        c2                               4  c9                               9 
    x2        c3                               6  c4                               7 
    x2        c5                               7  c1                              13 
    x2        c8                               9 
    x3        Obj                            400  c9                              35 
    x3        c1                             100  c3                              40 
    x3        c4                              50  c5                              55 
    x3        c6                              10  c2                              20 
    x3        c0                              80  c8                              30 
    x3        c7                              20 
    x4        c4                              40  c9                              29 
    x4        c8                              29  Obj                            300 
    x4        c3                              30  c7                              14 
    x4        c0                              70  c2                              20 
    x4        c1                             100  c5                              40 
    x4        c6                               4 
    x5        c6                              10  c0                              80 
    x5        c3                              40  Obj                            400 
    x5        c2                              30  c5                              40 
    x5        c4                              40  c1                              90 
    x5        c8                              20  c7                              20 
    x5        c9                              20 
    x6        Obj                            205  c1                              75 
    x6        c0                              45  c3                              16 
    x6        c5                              21  c4                              19 
    x6        c2                               8  c8                              12 
    x6        c7                               6  c9                              16 
    x7        c9                              15  c1                              25 
    x7        c8                              12  c4                               7 
    x7        c0                              15  Obj                            120 
    x7        c7                              12  c2                               3 
    x7        c3                               5  c6                               6 
    x7        c5                               9 
    x8        Obj                            160  c8                              10 
    x8        c2                              12  c4                              18 
    x8        c7                              10  c5                              18 
    x8        c1                              28  c0                              28 
    x8        c3                              18  c9                              10 
    x9        c9                              30  c3                              24 
    x9        c0                              90  c8                              30 
    x9        c5                              29  c6                               6 
    x9        Obj                            580  c7                              18 
    x9        c4                              29  c1                             120 
    x9        c2                              14 
    x10       c5                              70  Obj                            400 
    x10       c0                             130  c7                              42 
    x10       c2                              40  c6                              32 
    x10       c1                             130  c3                              60 
    x10       c4                              70  c9                              42 
    x10       c8                              42 
    x11       c8                              18  c3                              16 
    x11       c0                              32  c6                               3 
    x11       c1                              32  c4                              21 
    x11       c9                              20  c2                               6 
    x11       c7                               9  c5                              21 
    x11       Obj                            140 
    x12       Obj                            100  c2                               3 
    x12       c8                              18  c5                              17 
    x12       c7                              12  c0                              20 
    x12       c4                              17  c9                              18 
    x12       c1                              40  c3                              11 
    x13       c1                             160  c7                             100 
    x13       Obj                           1300  c5                              35 
    x13       c8                             110  c4                              30 
    x13       c6                              70  c3                              30 
    x13       c0                             120  c9                             120 
    x13       c2                              20 
    x14       Obj                            650  c5                              25 
    x14       c6                              10  c8                              20 
    x14       c0                              40  c3                              25 
    x14       c2                               5  c1                              40 
    x14       c7                              20  c4                              25 
    x14       c9                              20 
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
ENDATA