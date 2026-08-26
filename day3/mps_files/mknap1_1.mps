* SCIP STATISTICS
*   Problem name     : mknap_1
*   Variables        : 10 (10 binary, 0 integer, 0 implicit integer, 0 continuous)
*   Constraints      : 10
NAME          mknap_1
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
    x0        Obj                          600.1  c1                              20 
    x0        c4                              60  c2                              60 
    x0        c7                              45  c9                              65 
    x0        c3                              60  c6                               5 
    x0        c8                              55  c0                              20 
    x0        c5                              60 
    x1        c9                              14  c0                               5 
    x1        c2                               3  c3                               8 
    x1        c4                              13  c6                               2 
    x1        c8                              14  c7                              14 
    x1        c5                              13  Obj                          310.5 
    x1        c1                               7 
    x2        c1                             130  c5                              70 
    x2        c4                              70  c6                              20 
    x2        c0                             100  c3                              70 
    x2        c7                              80  c8                              80 
    x2        c9                              80  Obj                           1800 
    x2        c2                              50 
    x3        c2                             100  c7                             180 
    x3        c8                             200  c0                             200 
    x3        c6                             100  c5                             280 
    x3        c1                             280  c4                             250 
    x3        Obj                           3850  c9                             220 
    x3        c3                             200 
    x4        c3                               4  c5                               4 
    x4        c0                               2  c7                               6 
    x4        c2                               4  c9                               6 
    x4        c6                               2  c1                               2 
    x4        Obj                           18.6  c4                               4 
    x4        c8                               6 
    x5        c7                              10  c2                               2 
    x5        c1                               8  c9                              10 
    x5        Obj                          198.7  c4                              10 
    x5        c0                               4  c6                               5 
    x5        c8                              10  c3                               6 
    x5        c5                              10 
    x6        c5                              70  Obj                            882 
    x6        c4                              60  c8                              50 
    x6        c1                             110  c0                              60 
    x6        c3                              40  c9                              50 
    x6        c6                              10  c2                              20 
    x6        c7                              40 
    x7        c8                             140  c0                             150 
    x7        c6                              60  c9                             180 
    x7        c4                              90  c1                             210 
    x7        c3                              70  c2                              40 
    x7        c7                             100  c5                             105 
    x7        Obj                           4200 
    x8        Obj                          402.5  c7                              20 
    x8        c8                              30  c1                             100 
    x8        c5                              22  c0                              80 
    x8        c2                               6  c3                              16 
    x8        c4                              20  c9                              30 
    x9        c5                              28  c4                              24 
    x9        c0                              40  c8                              40 
    x9        c1                              40  c2                              12 
    x9        c3                              20  Obj                            327 
    x9        c9                              50 
    INTEND    'MARKER'                            'INTEND'                           
RHS
    RHS       c0                             450  c1                             540 
    RHS       c2                             200  c3                             360 
    RHS       c4                             440  c5                             480 
    RHS       c6                             200  c7                             360 
    RHS       c8                             440  c9                             480 
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
ENDATA