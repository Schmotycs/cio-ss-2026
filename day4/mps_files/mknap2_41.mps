* SCIP STATISTICS
*   Problem name     : mknap_41
*   Variables        : 34 (34 binary, 0 integer, 0 implicit integer, 0 continuous)
*   Constraints      : 4
NAME          mknap_41
OBJSENSE
  MAX
ROWS
 N  Obj 
 L  c0 
 L  c1 
 L  c2 
 L  c3 
COLUMNS
    INTSTART  'MARKER'                            'INTORG'                           
    x0        Obj                            560  c1                              16 
    x0        c0                              40  c2                              38 
    x0        c3                              38 
    x1        Obj                            620  c1                              16 
    x1        c0                              30  c2                              71 
    x1        c3                              42 
    x2        c1                               4  c3                               7 
    x2        c0                               3  Obj                             68 
    x2        c2                               5 
    x3        c0                              12  Obj                            328 
    x3        c2                              40  c3                              20 
    x3        c1                              18 
    x4        c1                               6  Obj                             47 
    x4        c0                               3  c2                               8 
    x5        c0                              18  c3                               3 
    x5        Obj                            122  c2                              12 
    x6        c0                              25  c1                               8 
    x6        c2                              15  Obj                            196 
    x6        c3                               4 
    x7        c3                               1  c0                               1 
    x7        c1                               2  Obj                             41 
    x8        c1                               1  Obj                             25 
    x8        c3                               2  c2                               1 
    x8        c0                               1 
    x9        c2                              20  Obj                            115 
    x9        c0                               8  c3                               4 
    x9        c1                               6 
    x10       c2                               3  c3                               6 
    x10       c0                               1  c1                               2 
    x10       Obj                             82 
    x11       Obj                             22  c0                               1 
    x11       c1                               1  c3                               1 
    x12       Obj                            631  c2                              40 
    x12       c0                              49  c1                              70 
    x12       c3                              18 
    x13       c0                               8  c1                               9 
    x13       Obj                            132  c2                               6 
    x13       c3                              15 
    x14       Obj                            420  c1                              22 
    x14       c0                              21  c2                               8 
    x14       c3                              38 
    x15       c3                              10  Obj                             86 
    x15       c0                               6  c1                               4 
    x16       c2                               6  c0                               1 
    x16       Obj                             42  c3                               4 
    x16       c1                               1 
    x17       c0                               5  c3                               8 
    x17       c1                               5  c2                               4 
    x17       Obj                            103 
    x18       c0                              10  c2                              22 
    x18       c1                              10  Obj                            215 
    x18       c3                               6 
    x19       c0                               8  c1                               6 
    x19       c2                               4  Obj                             81 
    x20       c1                               4  c0                               2 
    x20       c2                               6  Obj                             91 
    x21       c2                               1  Obj                             26 
    x21       c0                               1  c3                               3 
    x22       Obj                             49  c1                               4 
    x22       c2                               5 
    x23       Obj                            316  c2                               8 
    x23       c3                               6  c1                               8 
    x23       c0                              42 
    x24       Obj                             72  c2                               2 
    x24       c3                               1  c1                               4 
    x24       c0                               6 
    x25       Obj                             71  c2                               8 
    x25       c0                               4  c3                               3 
    x25       c1                               3 
    x26       Obj                             49  c0                               8 
    x27       c2                              20  c3                               3 
    x27       Obj                            108  c1                              10 
    x28       c3                               5  c0                              10 
    x28       Obj                            116 
    x29       c1                               6  c3                               4 
    x29       Obj                             90  c0                               1 
    x30       c3                              18  c0                               8 
    x30       Obj                            215  c1                              22 
    x30       c2                              13 
    x31       Obj                             58  c3                               3 
    x31       c2                               6  c0                               3 
    x32       c2                               1  c0                               2 
    x32       Obj                             47  c3                               4 
    x32       c1                               2 
    x33       c0                               4  c1                               2 
    x33       c2                               2  Obj                             81 
    INTEND    'MARKER'                            'INTEND'                           
RHS
    RHS       c0                             163  c1                             165 
    RHS       c2                             239  c3                             168 
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
 BV Bound     x28                                
 BV Bound     x29                                
 BV Bound     x30                                
 BV Bound     x31                                
 BV Bound     x32                                
 BV Bound     x33                                
ENDATA