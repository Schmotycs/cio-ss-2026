* SCIP STATISTICS
*   Problem name     : mknap_5
*   Variables        : 39 (39 binary, 0 integer, 0 implicit integer, 0 continuous)
*   Constraints      : 5
NAME          mknap_5
OBJSENSE
  MAX
ROWS
 N  Obj 
 L  c0 
 L  c1 
 L  c2 
 L  c3 
 L  c4 
COLUMNS
    INTSTART  'MARKER'                            'INTORG'                           
    x0        Obj                            560  c4                              38 
    x0        c3                               8  c2                              38 
    x0        c1                              16  c0                              40 
    x1        Obj                           1125  c0                              91 
    x1        c4                              52  c3                              71 
    x1        c1                              92  c2                              39 
    x2        c4                              30  c3                              30 
    x2        c0                              10  c2                              32 
    x2        c1                              41  Obj                            300 
    x3        c3                              60  c4                              42 
    x3        c1                              16  c2                              71 
    x3        c0                              30  Obj                            620 
    x4        Obj                           2100  c1                             150 
    x4        c2                              80  c4                             170 
    x4        c3                             200  c0                             160 
    x5        c1                              23  c0                              20 
    x5        c2                              26  c4                               9 
    x5        c3                              18  Obj                            431 
    x6        c2                               5  Obj                             68 
    x6        c4                               7  c1                               4 
    x6        c0                               3  c3                               6 
    x7        c2                              40  c1                              18 
    x7        c4                              20  c0                              12 
    x7        Obj                            328  c3                              30 
    x8        c1                               6  c2                               8 
    x8        c0                               3  Obj                             47 
    x8        c3                               4 
    x9        c2                              12  c4                               3 
    x9        c3                               8  c0                              18 
    x9        Obj                            122 
    x10       c0                               9  c1                              12 
    x10       c4                              21  c3                              31 
    x10       Obj                            322  c2                              30 
    x11       c2                              15  c3                               6 
    x11       Obj                            196  c4                               4 
    x11       c1                               8  c0                              25 
    x12       c3                               3  Obj                             41 
    x12       c1                               2  c0                               1 
    x12       c4                               1 
    x13       c4                               2  c0                               1 
    x13       c2                               1  Obj                             25 
    x13       c1                               1 
    x14       c4                              14  c0                              10 
    x14       Obj                            425  c2                              23 
    x14       c3                              18 
    x15       c0                             280  c3                              60 
    x15       Obj                           4260  c1                             200 
    x15       c4                             310  c2                             100 
    x16       Obj                            416  c4                               8 
    x16       c0                              10  c1                              20 
    x16       c3                              21 
    x17       c4                               4  c2                              20 
    x17       c1                               6  Obj                            115 
    x17       c3                               4  c0                               8 
    x18       c2                               3  c1                               2 
    x18       Obj                             82  c0                               1 
    x18       c4                               6 
    x19       c0                               1  c3                               2 
    x19       c1                               1  c4                               1 
    x19       Obj                             22 
    x20       c0                              49  c4                              18 
    x20       Obj                            631  c3                              32 
    x20       c1                              70  c2                              40 
    x21       Obj                            132  c3                              15 
    x21       c1                               9  c0                               8 
    x21       c4                              15  c2                               6 
    x22       c1                              22  c0                              21 
    x22       Obj                            420  c3                              31 
    x22       c4                              38  c2                               8 
    x23       c4                              10  c3                               2 
    x23       c0                               6  c1                               4 
    x23       Obj                             86 
    x24       c2                               6  c1                               1 
    x24       c3                               2  Obj                             42 
    x24       c0                               1  c4                               4 
    x25       c4                               8  c1                               5 
    x25       Obj                            103  c2                               4 
    x25       c3                               7  c0                               5 
    x26       c4                               6  c2                              22 
    x26       Obj                            215  c3                               8 
    x26       c1                              10  c0                              10 
    x27       c0                               8  c3                               2 
    x27       Obj                             81  c2                               4 
    x27       c1                               6 
    x28       c1                               4  c0                               2 
    x28       c2                               6  c3                               8 
    x28       Obj                             91 
    x29       c4                               3  c0                               1 
    x29       Obj                             26  c2                               1 
    x30       Obj                             49  c1                               4 
    x30       c2                               5  c3                               2 
    x31       c3                               8  c4                              10 
    x31       Obj                            420  c0                              10 
    x31       c2                              14  c1                              12 
    x32       c0                              42  Obj                            316 
    x32       c2                               8  c3                               6 
    x32       c4                               6  c1                               8 
    x33       c2                               2  c0                               6 
    x33       Obj                             72  c1                               4 
    x33       c3                               7  c4                               1 
    x34       c2                               8  Obj                             71 
    x34       c0                               4  c3                               1 
    x34       c4                               3  c1                               3 
    x35       c0                               8  Obj                             49 
    x36       Obj                            108  c2                              20 
    x36       c1                              10  c4                               3 
    x37       Obj                            116  c0                              10 
    x37       c3                              20  c4                               5 
    x38       Obj                             90  c3                               8 
    x38       c0                               1  c1                               6 
    x38       c4                               4 
    INTEND    'MARKER'                            'INTEND'                           
RHS
    RHS       c0                             600  c1                             500 
    RHS       c2                             500  c3                             500 
    RHS       c4                             600 
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
 BV Bound     x34                                
 BV Bound     x35                                
 BV Bound     x36                                
 BV Bound     x37                                
 BV Bound     x38                                
ENDATA