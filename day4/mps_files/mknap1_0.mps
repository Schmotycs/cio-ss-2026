* SCIP STATISTICS
*   Problem name     : mknap_0
*   Variables        : 6 (6 binary, 0 integer, 0 implicit integer, 0 continuous)
*   Constraints      : 10
NAME          mknap_0
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
    x0        Obj                            100  c5                               5 
    x0        c4                               5  c7                               3 
    x0        c3                               5  c8                               3 
    x0        c0                               8  c2                               3 
    x0        c1                               8  c9                               3 
    x1        c9                               2  Obj                            600 
    x1        c8                               2  c1                              12 
    x1        c2                               6  c5                              13 
    x1        c4                              13  c0                              12 
    x1        c3                              10 
    x2        c8                               4  c1                              13 
    x2        c5                               8  c0                              13 
    x2        c7                               4  c4                               8 
    x2        c2                               4  c3                               8 
    x2        c9                               4  Obj                           1200 
    x3        c5                              48  Obj                           2400 
    x3        c3                              32  c9                               8 
    x3        c4                              42  c2                              18 
    x3        c1                              75  c0                              64 
    x4        c6                               8  c4                               6 
    x4        c8                               8  c5                               6 
    x4        c2                               6  c0                              22 
    x4        c3                               6  Obj                            500 
    x4        c7                               8  c1                              22 
    x4        c9                               8 
    x5        c5                              20  c4                              20 
    x5        c3                              12  c0                              41 
    x5        c1                              41  Obj                           2000 
    x5        c2                               4  c8                               4 
    x5        c9                               4 
    INTEND    'MARKER'                            'INTEND'                           
RHS
    RHS       c0                              80  c1                              96 
    RHS       c2                              20  c3                              36 
    RHS       c4                              44  c5                              48 
    RHS       c6                              10  c7                              18 
    RHS       c8                              22  c9                              24 
BOUNDS
 BV Bound     x0                                 
 BV Bound     x1                                 
 BV Bound     x2                                 
 BV Bound     x3                                 
 BV Bound     x4                                 
 BV Bound     x5                                 
ENDATA