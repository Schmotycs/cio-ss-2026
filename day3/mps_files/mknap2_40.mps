* SCIP STATISTICS
*   Problem name     : mknap_40
*   Variables        : 27 (27 binary, 0 integer, 0 implicit integer, 0 continuous)
*   Constraints      : 4
NAME          mknap_40
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
    x1        c2                              39  Obj                           1125 
    x1        c1                              92  c3                              52 
    x1        c0                              91 
    x2        c0                               3  Obj                             68 
    x2        c3                               7  c1                               4 
    x2        c2                               5 
    x3        c0                               3  c1                               6 
    x3        Obj                             47  c2                               8 
    x4        c2                              12  Obj                            122 
    x4        c3                               3  c0                              18 
    x5        Obj                            196  c3                               4 
    x5        c1                               8  c0                              25 
    x5        c2                              15 
    x6        c1                               2  c3                               1 
    x6        c0                               1  Obj                             41 
    x7        c2                               1  c3                               2 
    x7        c1                               1  c0                               1 
    x7        Obj                             25 
    x8        c1                               6  Obj                            115 
    x8        c3                               4  c2                              20 
    x8        c0                               8 
    x9        c1                               2  c0                               1 
    x9        Obj                             82  c2                               3 
    x9        c3                               6 
    x10       c0                               1  Obj                             22 
    x10       c3                               1  c1                               1 
    x11       c2                              40  Obj                            631 
    x11       c0                              49  c3                              18 
    x11       c1                              70 
    x12       c3                              15  c1                               9 
    x12       c2                               6  c0                               8 
    x12       Obj                            132 
    x13       c3                              38  c0                              21 
    x13       Obj                            420  c2                               8 
    x13       c1                              22 
    x14       c3                              10  c1                               4 
    x14       Obj                             86  c0                               6 
    x15       c1                               1  Obj                             42 
    x15       c2                               6  c3                               4 
    x15       c0                               1 
    x16       c2                               4  c3                               8 
    x16       c0                               5  Obj                            103 
    x16       c1                               5 
    x17       Obj                             81  c1                               6 
    x17       c2                               4  c0                               8 
    x18       Obj                             26  c3                               3 
    x18       c0                               1  c2                               1 
    x19       c2                               5  Obj                             49 
    x19       c1                               4 
    x20       Obj                            316  c2                               8 
    x20       c3                               6  c0                              42 
    x20       c1                               8 
    x21       c1                               4  c3                               1 
    x21       c2                               2  c0                               6 
    x21       Obj                             72 
    x22       c2                               8  Obj                             71 
    x22       c1                               3  c3                               3 
    x22       c0                               4 
    x23       Obj                             49  c0                               8 
    x24       c1                              10  c2                              20 
    x24       c3                               3  Obj                            108 
    x25       c0                              10  Obj                            116 
    x25       c3                               5 
    x26       c0                               1  c1                               6 
    x26       Obj                             90  c3                               4 
    INTEND    'MARKER'                            'INTEND'                           
RHS
    RHS       c0                             207  c1                             185 
    RHS       c2                             168  c3                             160 
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
ENDATA