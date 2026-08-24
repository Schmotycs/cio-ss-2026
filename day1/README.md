# Day 1

Welcome to day one of the course Computational Integer Optimization. Today, we will discuss tooling and mathematical modeling.

## Demo: Debugging merge sort

We are given a broken merge sort implementation. Our task in this demo is to find the bug and fix it.

## Exercise: Debugging DFS

We are given a broken dfs implementation. Try to fix it!

## Demo: Modeling an MIP in SCIP

Solve the following problem in SCIP

```lp
Maximize
 obj: x1 + 2 x2 + 3 x3 + x4
Subject To
 c1: - x1 + x2 + x3 + 10 x4 <= 20
 c2: x1 - 3 x2 + x3 <= 30
 c3: x2 - 3.5 x4 = 0
Bounds
 0 <= x1 <= 40
 2 <= x4 <= 3
General
 x4
End
```

## Exercise: Modelling the 8 queens problem in SCIP 

Use SCIP to model the following problem: how can you place 8 queens in a chess board such that no two queens attack each other?

Bonus: There are 92 possible placement can you print all of them? Hit you need to use `SCIPfreeTransform`.

## Mentioned today

C++ Algorithms: https://github.com/HappyCerberus/book-cpp-algorithms
SCIP Documentation: https://www.scipopt.org/doc/html/