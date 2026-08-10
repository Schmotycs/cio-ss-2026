# Introduction to Programming in C++

## Your First C++ Program

Create a file `introduction/collatz/collatz.cpp`. C++ source files carry the extension `.cpp`, headers `.h` or `.hpp`. Type in the following program, which generates the collatz sequence. The control flow should be self explanatory.

```cpp
#include <iostream>
#include <vector>

int main() {
    int n;
    std::cin >> n;
    std::vector<int> series;
    series.push_back(n);
    while (n != 1) {
        if (n % 2 == 0) {
            n = n / 2;
        } else {
            n = 3 * n + 1;
        }
        series.push_back(n);
    }
    /*
    * A more modern way of doing
    * for (int i = 0; i < std::ssize(series); ++i){
    *     ...
    * }
    */
    for (int x : series) {
        std::cout << x << " ";
    }
    std::cout << "\n";
    return 0;
}
```

Compile and run it with

```bash
clang++ -std=c++23 collatz.cpp -o collatz
./collatz
```

We will use `-std=c++23` throughout. Execution starts at `main`, whose return value is the exit status of the process. This can be queried via

```bash
echo $?
```

## Types

We will limit ourselves to the following data types in this course. We list all the things that you need to be aware of here. As with the collatz program, try these out yourself: create a file `introduction/types/types.cpp` (all folder paths in this tutorial are relative to the repository root), type each of the following programs into it in turn, and compile and run it the same way as before.

```cpp
#include <iostream>
#include <format>
int main(){
    int i = 5; // Integers
    double j = 10.0; // Double

    double k = i/2; // 2.0 division of int / int (2) truncates
    double l = i/2.0;// 2.5 division of int/ double -> int get converted to double -> double / double

    double arr[] = {1.0, 2.0, 3.0};

    // For a variety of reasons, C++ programmers use auto instead of declaring the variable type manually. When auto is used the type of the variable is determined by the right hand side
    auto a = 5; // a is an int var
    auto b = 2.5; // b is a double var
    auto c = 5.0; // c is a double var
    auto d = arr[1]; // d is equal to 2.0 and has type double

    auto pi = 3.14159265359;
    std::cout << std::format("Pi is {:.3f}",pi); // Prints Pi is 3.142, the last digit is rounded
    return 0;
}
```

A more complex usecase example of auto

```cpp
auto foo(){ // The return type of foo is determined automatically
    return 5.0; // Since we return 5.0 it is deduced as double
}

int main(){
    auto f =  foo(); // foo returns a double hence f is a double.
    return 0;
}
```

Finally, we introduce strings and chars

```cpp
#include <string>
#include <iostream>

void foo (const char * s){
    std::cout << "This is a function that needs a C string. And the string is " 
    << s  
    << std::endl;
}

int main(){
    const char * c = "This is a C string";
    std::string p = "This is a C++ string";

    // The following demonstrates how you pass a C++ string to a function that needs a C string
    foo(p.c_str()); 
    return 0;
}
```

## Classes and Polymorphism

We now write a program that draws shapes. There are three kinds of shapes, circles, squares and triangles, and each one draws itself differently. We will also split our program to multiple files, so create the folder `introduction/shapes` with the following contents.

```
introduction/shapes/
├── CMakeLists.txt
├── shape.hpp
├── circle.hpp
├── circle.cpp
├── square.hpp
├── square.cpp
├── triangle.hpp
├── triangle.cpp
└── main.cpp
```

The convention in C++ is one class per header and source pair. The header declares what a class can do, the source defines how it is done. We first introduce the class `Shape`, which describes what every shape has in common and nothing more.

```cpp
#pragma once

class Shape {
public:
    virtual ~Shape() = default;    // needed as soon as we destroy a shape through a Shape pointer
    virtual void draw() const = 0; // = 0 : every Shape can draw, no Shape says how
};
```

The `= 0` makes `draw` a pure virtual function and `Shape` an abstract class. One can no longer write `Shape s;`, since the class only states what a shape must be able to do. The line `#pragma once` prevents the header from being pasted in twice when several files include it.

A concrete shape inherits from `Shape` and supplies the missing `draw`. We first write the circle.

```cpp
// circle.hpp
#pragma once
#include "shape.hpp"

class Circle : public Shape {
public:
    void draw() const override;
};
```

```cpp
// circle.cpp
#include "circle.hpp"
#include <iostream>

void Circle::draw() const {
    std::cout << "Hey I am a circle\n";
}
```

Note that we write `#include "circle.hpp"` with quotes instead of angle brackets. Quotes mean look next to this file, angle brackets mean look where the compiler keeps its own headers. The keyword `override` is not decoration: the compiler rejects it if nothing in the base class matches, which catches a mistyped signature that would otherwise silently declare a new unrelated function.

The remaining two shapes are the same lines with the word substituted.

```cpp
// square.hpp
#pragma once
#include "shape.hpp"

class Square : public Shape {
public:
    void draw() const override;
};

// square.cpp
#include "square.hpp"
#include <iostream>

void Square::draw() const {
    std::cout << "Hey I am a square\n";
}

// triangle.hpp
#pragma once
#include "shape.hpp"

class Triangle : public Shape {
public:
    void draw() const override;
};

// triangle.cpp
#include "triangle.hpp"
#include <iostream>

void Triangle::draw() const {
    std::cout << "Hey I am a triangle\n";
}
```

Finally, in `main.cpp` we build ten shapes, each picked at random, and ask every one of them to draw itself.

```cpp
#include "circle.hpp"
#include "square.hpp"
#include "triangle.hpp"

#include <memory>
#include <random>
#include <vector>

int main(){
    std::mt19937 gen(std::random_device{}()); // a random number generator, seeded once
    std::uniform_real_distribution<double> u(0.0, 1.0);

    // 1. We create a vector that will own the ten shapes
    std::vector<std::unique_ptr<Shape>> shapes;
    for (int i = 0; i < 10; ++i){
        double x = u(gen); // uniformly distributed in [0,1)
        // 2. We create a random shape in heap memory and hand ownership over to the vector
        if (x < 1.0/3.0){
            shapes.push_back(std::make_unique<Circle>());
        } else if (x < 2.0/3.0){
            shapes.push_back(std::make_unique<Square>());
        } else {
            shapes.push_back(std::make_unique<Triangle>());
        }
    }

    for (const auto & shape : shapes){
        // 3. Which draw runs is decided by the object, not by the pointer type
        shape->draw();
    }
    return 0; // the vector goes out of scope and every shape is destroyed, no delete written anywhere
}
```

We go through this example step by step. `shape` in the last loop is a pointer to `Shape`, and member access through a pointer is written with an arrow instead of a dot: `shape->draw()` is shorthand for `(*shape).draw()`, dereference first, then call. The dot we have used so far, as in `p.c_str()` in the section *Types*, works on the object itself. In Python this distinction never arises, every variable there is a reference and the dot does both jobs. Strictly speaking `shape` is a `std::unique_ptr` rather than a raw pointer, but `std::unique_ptr` forwards `*` and `->` to the pointer it owns precisely so that it can be used like one.

Now, `Shape` does not know how to draw anything. Nevertheless the correct message is printed for each element. Which `draw` is executed is decided while the program runs, from the object actually pointed at. We call this dynamic dispatch. Python does this for every method call; C++ does it only where `virtual` asks for it.

This is also the reason the vector holds pointers instead of shapes. `std::vector<Shape>` is not possible since `Shape` is an abstract class, and even if it were, every element of a vector must have the same size, whereas the whole point here is that the vector holds a mixture. To this end, the shapes themselves live in heap memory and the vector holds pointers to them.

`std::make_unique<Circle>()` creates a `Circle` in heap memory and hands it to a `std::unique_ptr<Shape>`, a pointer that owns what it points at: when the pointer is destroyed, so is the shape. Unique means exactly one owner at a time, hence the pointer is moved into the vector rather than copied, and the program contains no `delete`. At the end of `main` the vector is destroyed, which destroys the ten pointers, each of which destroys its shape. We come back to how this works in the section *Stack and Heap Memory*.

The destructor in `shape.hpp` is what makes this safe. The vector destroys a `Circle` through a `Shape` pointer, so `~Shape` must be `virtual`, otherwise only the `Shape` part of the object is cleaned up. One can easily 'forget' this keyword; drop it and clang tells you directly: *delete called on 'Shape' that is abstract but has non-virtual destructor*.

To compile the program we must now hand four source files to `clang++`. This becomes tiresome quickly, so we use CMake instead. Put the following in `CMakeLists.txt` and take it as magic for now.

```cmake
cmake_minimum_required(VERSION 4.0)
project(shapes CXX)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_executable(draw main.cpp circle.cpp square.cpp triangle.cpp)
```

Note that every `.cpp` is listed and no header is. Headers are pasted into the sources by `#include`; it is the sources that are compiled, each on its own, and then linked together into one executable.

Now it is time to compile and run. In the terminal, go to the folder `introduction/shapes` and run

```bash
cmake -S . -B build
cmake --build build
./build/draw
```

## Functions, Lambdas and Function Objects

As an exercise we now write a function that multiplies a number `a` by a factor `b`, and we do it in three ways: as an ordinary function, as a lambda, and as a function object. Create `introduction/multiply/multiply.cpp`.

```cpp
#include <iostream>

// 1. An ordinary function, both a and b are passed on every call
int multiply_by(int a, int b){
    return a * b;
}

// 3. A function object, a class whose operator() makes its objects callable like a function
class MultiplyBy{
public:
    MultiplyBy(int b) : b_(b) {} // the constructor stores the factor in the member b_
    int operator()(int a) const { return a * b_; }
private:
    int b_;
};

int main(){
    std::cout << multiply_by(5, 3) << "\n"; // 15

    // 2. A lambda, b is captured from the surrounding scope, only a is passed
    int b = 3;
    auto multiply_by_b = [b](int a){ return a * b; };
    std::cout << multiply_by_b(5) << "\n"; // 15

    MultiplyBy multiply_by_obj(3); // the factor is fixed once, at construction
    std::cout << multiply_by_obj(5) << "\n"; // 15
    return 0;
}
```

Compile and run it with

```bash
clang++ -std=c++23 multiply.cpp -o multiply
./multiply
```

The ordinary function needs no explanation, both arguments arrive at every call. The lambda is for the situation where `b` is already fixed: the bracket `[b]` is the capture list, and the variables listed there are copied into the lambda at the point where it is defined. Changing `b` afterwards does not change `multiply_by_b`; writing `[&b]` instead would capture a reference to `b` rather than a copy. A lambda has a compiler-generated type with no name, hence `auto`.

The function object is the same idea spelled out by hand. `MultiplyBy` is a class with a member `b_`, a constructor that fills it, and an `operator()` that does the multiplication, so an object of this class is called like a function while carrying its factor around as state. The constructor syntax `: b_(b)` is new: it is called a member initializer list and sets the member `b_` to the argument `b` before the constructor body runs. In fact a lambda is exactly such a class written for us by the compiler, the capture list becoming the members.

## RAII and Interfacing with C Libraries

C++ can call C libraries directly, and we will rely on this often. A C library typically hands out resources in counterpart pairs: one function acquires the resource, a second function must be called to give it back. Our example is SQLite, a database engine written in C: `sqlite3_open` opens a connection to a database file and `sqlite3_close` closes it. We write a program that reads a database filename from standard input, fills a small table of knapsack items and prints it. Create `introduction/sqlite/sqlite.cpp`.

```cpp
#include <iostream>
#include <sqlite3.h>
#include <string>

int main(){
    std::string filename;
    std::cin >> filename;

    // sqlite3_open is a C function, it needs a C string (recall the section Types)
    sqlite3 * db = nullptr;
    if (sqlite3_open(filename.c_str(), &db) != SQLITE_OK){
        std::cout << "Could not open " << filename << "\n";
        sqlite3_close(db); // sqlite3_open hands out a connection even on failure, and it too must be closed
        return 1;
    }

    const char * sql =
        "DROP TABLE IF EXISTS items;"
        "CREATE TABLE items (name TEXT, weight INT, value INT);"
        "INSERT INTO items VALUES ('hammer', 8, 30), ('rope', 3, 14), ('compass', 1, 25);"
        "SELECT * FROM items;";

    // the callback runs once per row of the SELECT
    auto print_row = [](void *, int ncols, char ** row, char **){
        for (int i = 0; i < ncols; ++i){
            std::cout << row[i] << " ";
        }
        std::cout << "\n";
        return 0;
    };
    sqlite3_exec(db, sql, print_row, nullptr, nullptr);

    sqlite3_close(db); // every sqlite3_open must be paired with a sqlite3_close
    return 0;
}
```

Compile and run it with

```bash
clang++ -std=c++23 sqlite.cpp -o sqlite -lsqlite3
./sqlite
```

The new flag `-lsqlite3` tells the linker to link our program against the SQLite library; without it every `sqlite3_` function is an unresolved name. The program waits for you to type a filename and press enter; type `course.db`. SQLite creates the file if it does not exist. Afterwards you can inspect the database with the command line tool, `sqlite3 course.db` (type `.quit` to leave).

Two things in this program deserve a closer look. The first is the signature of `sqlite3_open`:

```cpp
int sqlite3_open(const char * filename, sqlite3 ** db);
```

The return value is already taken by the error code, so the function cannot also return the connection. Instead we declare a pointer `db` and pass its address `&db`, and the library writes the freshly built connection through it:

```
 db   : sqlite3 *   ── after the call, points at ──►  the connection object
&db   : sqlite3 **  ── lets sqlite3_open write into the variable db itself
```

A parameter used this way is called an out-parameter, and passing `&pointer` to receive a handle is the standard idiom of C libraries. It will come back many times in this course: SCIP, the solver we build on, creates its central object with exactly this shape, `SCIPcreate(&scip)`.

The second is the callback. `sqlite3_exec` wants a plain C function pointer that it can call once per row, and a C library knows nothing about C++ function objects. A lambda with an empty capture list `[]` converts to exactly such a function pointer. Recall from the section *Functions, Lambdas and Function Objects* that the captures become the members of a compiler-generated class; only a captureless lambda has no such state and can therefore act as a plain function.

We never look inside a `sqlite3`, we only hold a pointer to it and pass that pointer back to the library. C has no destructors, so the library trusts us to call the counterpart function `sqlite3_close` ourselves. One can easily 'forget' to do so, and this can happen in a nontrivial way. Suppose we decide that a failing query should abort the program.

```cpp
#include <iostream>
#include <sqlite3.h>
#include <string>

int main(){
    std::string filename;
    std::cin >> filename;

    sqlite3 * db = nullptr;
    if (sqlite3_open(filename.c_str(), &db) != SQLITE_OK){
        std::cout << "Could not open " << filename << "\n";
        sqlite3_close(db);
        return 1;
    }

    const char * sql =
        "DROP TABLE IF EXISTS items;"
        "CREATE TABLE items (name TEXT, weight INT, value INT);"
        "INSERT INTO items VALUES ('hammer', 8, 30), ('rope', 3, 14), ('compass', 1, 25);"
        "SELECT * FROM items;";

    auto print_row = [](void *, int ncols, char ** row, char **){
        for (int i = 0; i < ncols; ++i){
            std::cout << row[i] << " ";
        }
        std::cout << "\n";
        return 0;
    };
    if (sqlite3_exec(db, sql, print_row, nullptr, nullptr) != SQLITE_OK){
        std::cout << "Query failed: " << sqlite3_errmsg(db) << "\n";
        return 1; // early exit: sqlite3_close is never called, the connection stays open
    }

    sqlite3_close(db);
    return 0;
}
```

For a failing query we return without ever closing the connection — put a typo into the SQL string and you walk this path yourself. A database connection holds an open file, and the operating system limits how many files a process may hold open at once, so a program that keeps 'forgetting' eventually finds that every further open fails. One way to avoid this is to use a paradigm called RAII (Resource Acquisition Is Initialization): we tie the resource to an object whose destructor calls the counterpart function, so that every way out of the function, early or not, gives the resource back. We will use this paradigm often whenever we are required to call a counterpart function to our call. Replace the contents of `sqlite.cpp` with the following, then compile and run it again as before.

```cpp
#include <iostream>
#include <memory>
#include <sqlite3.h>
#include <string>

struct SqliteCloser{
    // 1. We create a `promise` to close the connection once the owner goes out of scope
    void operator()(sqlite3 * db) const noexcept { sqlite3_close(db); }
};

int main(){
    std::string filename;
    std::cin >> filename;

    // 2. Open into a raw pointer, then immediately hand ownership over, with the promise attached
    sqlite3 * raw = nullptr;
    int rc = sqlite3_open(filename.c_str(), &raw);
    std::unique_ptr<sqlite3, SqliteCloser> db(raw);
    if (rc != SQLITE_OK){
        std::cout << "Could not open " << filename << "\n";
        return 1; // the promise still closes the handle that the failed open handed out
    }

    const char * sql =
        "DROP TABLE IF EXISTS items;"
        "CREATE TABLE items (name TEXT, weight INT, value INT);"
        "INSERT INTO items VALUES ('hammer', 8, 30), ('rope', 3, 14), ('compass', 1, 25);"
        "SELECT * FROM items;";

    auto print_row = [](void *, int ncols, char ** row, char **){
        for (int i = 0; i < ncols; ++i){
            std::cout << row[i] << " ";
        }
        std::cout << "\n";
        return 0;
    };
    // 3. .get() hands the raw pointer to a C function that knows nothing about ownership
    if (sqlite3_exec(db.get(), sql, print_row, nullptr, nullptr) != SQLITE_OK){
        std::cout << "Query failed: " << sqlite3_errmsg(db.get()) << "\n";
        return 1; // early exit needs no special case, the promise is kept
    }
    return 0; // db goes out of scope, the promise is kept, sqlite3_close runs
}
```

This is the same `std::unique_ptr` as in the shape drawing program, except that we now attach our own deleter in place of the default one. `SqliteCloser` is a function object as in the previous section; `std::unique_ptr` executes it on the owned pointer when the variable goes out of scope. Note the two-step opening: the out-parameter forces us to open into a raw pointer first and hand ownership over on the very next line. From that line on every way out of `main` closes the connection, including the error branch of the open itself. The method `.get()` exists precisely for interfacing with C: it hands out the raw pointer without giving up ownership. Any C library that comes in acquire/release pairs is wrapped in exactly this way.

## Stack and Heap Memory

Unlike in higher languages such as Python, C and C++ allows you the possibility of managing your memory manually. Our running example in this section is the sieve of Eratosthenes, which finds the primes below 100 by crossing out the multiples of every prime it meets. Create `introduction/sieve/sieve.cpp`. We will rewrite this one program several times in this section; each time, replace the contents of `sieve.cpp` with the new version and compile and run it with

```bash
clang++ -std=c++23 sieve.cpp -o sieve
./sieve
```

We first introduced stack memory

```cpp
int foo(){
    // The array of 100 int (400 bytes) lives in stack memory
    int foo_arr[100];
    for (int i = 0; i < 100; ++i){
        foo_arr[i] = 1; // 1 means possible prime, 0 means crossed out
    }
    foo_arr[0] = 0;
    foo_arr[1] = 0;
    for (int i = 2; i < 100; ++i){
        if (foo_arr[i] == 1){ // i was never crossed out, it is prime
            for (int j = 2 * i; j < 100; j += i){
                foo_arr[j] = 0; // cross out the multiples of i
            }
        }
    }
    int count = 0;
    for (int i = 0; i < 100; ++i){
        count += foo_arr[i];
    }
    return count; // the number of primes below 100, which is 25
    // at the end of the function the 400 bytes of memory allocated are freed from stack memory automatically
}
int main(){
    auto a = foo();
    return 0;
}
```

Note that unlike Python, C++ does not check your indices. Writing `foo_arr[100]` compiles fine (valid indices are 0..99) and simply reads whatever happens to sit after the array — no `IndexError`, just garbage or a crash.

There are several weakness of the above program. For example, if the caller want the primes themselves instead of merely their count then `foo_arr` is no longer available within the `main` function — returning it would hand back a pointer to stack memory that has already been reclaimed. To this end, heap memory is introduced, that is, memory that must be allocated and freed manually. Replace the contents of `sieve.cpp` with the following and run it again.

```cpp
#include<iostream>
int * foo(){
    // foo returns a pointer to where foo_arr is stored
    int * foo_arr = new int[100]; // we request to be allocated memory for 100 ints
    for (int i = 0; i < 100; ++i){
        foo_arr[i] = 1;
    }
    foo_arr[0] = 0;
    foo_arr[1] = 0;
    for (int i = 2; i < 100; ++i){
        if (foo_arr[i] == 1){
            for (int j = 2 * i; j < 100; j += i){
                foo_arr[j] = 0;
            }
        }
    }
    return foo_arr;
}

int main(){
    int * main_arr = foo(); // main_arr points at the same heap block foo allocated
    for (int i = 0; i < 100; ++i){
        if (main_arr[i] == 1){
            std::cout << i << " ";
        }
    }
    std::cout << std::endl;
    delete[] main_arr; // We are finished with using the allocated memory, we free it
    return 0;
}
```

One can easily 'forget' to free allocated memory. We call this a memory leak. This can happen in nontrivial way

```cpp
#include<iostream>
int * foo(){
    // foo returns a pointer to where foo_arr is stored
    int * foo_arr = new int[100]; // we request to be allocated memory for 100 ints
    for (int i = 0; i < 100; ++i){
        foo_arr[i] = 1;
    }
    foo_arr[0] = 0;
    foo_arr[1] = 0;
    for (int i = 2; i < 100; ++i){
        if (foo_arr[i] == 1){
            for (int j = 2 * i; j < 100; j += i){
                foo_arr[j] = 0;
            }
        }
    }
    return foo_arr;
}

int main(){
    int * main_arr = foo();
    for (int i = 0; i < 100; ++i){
        if (main_arr[i] == 1){
            std::cout << i << " ";
        }
    }
    std::cout << std::endl;
    if (main_arr[97] == 1){
        return 1; // early exit: main_arr is never freed
    }
    delete[] main_arr; // We are finished with using the allocated memory, we free it
    return 0;
}
```

In the above code, since 97 is prime the condition holds and we return without ever freeing `main_arr`. Python would have collected the object for us once the last reference disappeared; C++ will not. This is the same situation as an `sqlite3_open` without its `sqlite3_close`: `new[]` has the counterpart `delete[]`, and an early return skips it. The remedy is the RAII paradigm from the section *RAII and Interfacing with C Libraries*. Replace the contents of `sieve.cpp` with the following and run it again.

```cpp
#include<iostream>
#include<memory>

struct IntArrayDeleter{
    //  1. We create a `promise` to free the memory once the owner gets deallocated,
    //     playing the role SqliteCloser played for database connections
    void operator()(int * p) const noexcept { delete[] p; }
};

auto foo(){
    // 2. We create a variable foo_arr that will own an int array, with the promise attached to it
    std::unique_ptr<int[], IntArrayDeleter> foo_arr(nullptr, IntArrayDeleter{});
    {
        int * temp = new int[100]; // we request to be allocated memory for 100 ints
        // Hand over ownership of temp to foo_arr
        foo_arr.reset(temp);
    }
    for (int i = 0; i < 100; ++i){
        foo_arr[i] = 1;
    }
    foo_arr[0] = 0;
    foo_arr[1] = 0;
    for (int i = 2; i < 100; ++i){
        if (foo_arr[i] == 1){
            for (int j = 2 * i; j < 100; j += i){
                foo_arr[j] = 0;
            }
        }
    }
    return foo_arr; // foo_arr is a std::unique_ptr<int[], IntArrayDeleter>
}

int main(){
    // 3. When foo returns, the array outlives foo_arr by being moved into main_arr, so the memory is not freed here
    auto main_arr = foo();
    for (int i = 0; i < 100; ++i){
        if (main_arr[i] == 1){
            std::cout << i << " ";
        }
    }
    std::cout << std::endl;
    return 0; // main_arr goes out of scope, the promise to free the memory is kept
}
```

We go through this example step by step. In the beginning we call the `foo` function with the request that the returned value from foo should be stored in `main_arr`. When the foo function is called we create a `std::unique_ptr` object. `std::unique_ptr` allows us to attach a callable class that will be executed as soon as the variable goes out of scope.
We then request heap memory and give ownership of it to `foo_arr` via the method `reset`. In the final line, `return foo_arr`, C++ will move the ownership from `foo_arr` to `main_arr`, hence the allocated memory continues to live — the moved-from `foo_arr` holds a null pointer and its deleter does nothing. At the end of the `main` function `main_arr` goes out of scope and the memory is freed.

Note that `std::unique_ptr<int[]>` already calls `delete[]` by default; we spell out `IntArrayDeleter` only to make the mechanism visible. The vector of `std::unique_ptr<Shape>` in the shape drawing program was the same promise with the default deleter, which is why that program frees nothing by hand.

A second usecase of heap memory is when we do not know the number of elements to be allocated beforehand. Suppose we want the primes below a bound `n` that the user provides. Replace the contents of `sieve.cpp` with the following and run it again; the program now waits for you to type the bound and press enter.

```cpp
#include <iostream>
int main(){
    int n;
    std::cin >> n; // Read the bound giving n
    if (n < 2){
        return 0; // there are no primes below 2
    }

    int * p = new int[n]; // Allocate space for n integers;
    // Standard C++ does not allow int p[n]; because n is not knowable at compile time. Some compiler allows you to
    // (and convert the code to a similar one like this at compilation). You should however never do this!
    for (int i = 0; i < n; ++i){
        p[i] = 1;
    }
    p[0] = 0;
    p[1] = 0;
    for (int i = 2; i < n; ++i){
        if (p[i] == 1){
            for (int j = 2 * i; j < n; j += i){
                p[j] = 0;
            }
        }
    }
    for (int i = 0; i < n; ++i){
        if (p[i] == 1){
            std::cout << i << " ";
        }
    }
    std::cout << std::endl;
    delete[] p;
}
```

C++ give us `std::vector` for this purpose (to allocate and free heap memory more easily). Again, replace the contents of `sieve.cpp` and run.


```cpp
#include <vector>
#include <iostream>
int main(){
    int n;
    std::cin >> n; // Read the bound giving n
    if (n < 2){
        return 0; // there are no primes below 2
    }
    std::vector<int> p(n, 1); // n ints, all initialized to 1
    p[0] = 0;
    p[1] = 0;
    for (int i = 2; i < n; ++i){
        if (p[i] == 1){
            for (int j = 2 * i; j < n; j += i){
                p[j] = 0;
            }
        }
    }
    for (int i = 0; i < n; ++i){
        if (p[i] == 1){
            std::cout << i << " ";
        }
    }
    std::cout << std::endl;
    // p is automatically freed here
}
```

We show how vector can be used to solve the earlier problem. We propose 2 solutions; try each of them in `sieve.cpp` as before.

```cpp
#include <vector>
#include <iostream>

auto foo(){
    std::vector<int> foo_arr(100, 1); // we request to be allocated memory for 100 ints, all initialized to 1
    foo_arr[0] = 0;
    foo_arr[1] = 0;
    for (int i = 2; i < 100; ++i){
        if (foo_arr[i] == 1){
            for (int j = 2 * i; j < 100; j += i){
                foo_arr[j] = 0;
            }
        }
    }
    return foo_arr;
}

int main(){
    auto main_arr = foo(); // auto is deduced to std::vector<int>
    for (int i = 0; i < 100; ++i){
        if (main_arr[i] == 1){
            std::cout << i << " ";
        }
    }
    std::cout << std::endl;
    return 0;
}
```

In this first example, we allocate heap memory through `std::vector`. At the end of the function the buffer owned by `foo_arr` is moved to `main_arr`, and it is only when `main` ends that the memory is freed.

```cpp
#include <vector>
#include <iostream>
#include <span>
#include <cassert>

void foo(std::span<int> foo_arr){
    assert(foo_arr.size() == 100);
    for (int i = 0; i < 100; ++i){
        foo_arr[i] = 1;
    }
    foo_arr[0] = 0;
    foo_arr[1] = 0;
    for (int i = 2; i < 100; ++i){
        if (foo_arr[i] == 1){
            for (int j = 2 * i; j < 100; j += i){
                foo_arr[j] = 0;
            }
        }
    }
}

int main(){
    std::vector<int> main_arr(100);
    foo(main_arr); // a vector converts implicitly to a span over its elements
    for (int i = 0; i < 100; ++i){
        if (main_arr[i] == 1){
            std::cout << i << " ";
        }
    }
    std::cout << std::endl;
    return 0;
}
```
In the second example, heap memory is allocated and owned by `main`. `main` then 'shares' this memory with the `foo` function. A `std::span` is a non-owning view: it holds a pointer and a length, and frees nothing.

We note that a third solution is possible
```cpp
#include <iostream>
#include <span>

void foo(std::span<int> foo_arr){
    for (int i = 0; i < 100; ++i){
        foo_arr[i] = 1;
    }
    foo_arr[0] = 0;
    foo_arr[1] = 0;
    for (int i = 2; i < 100; ++i){
        if (foo_arr[i] == 1){
            for (int j = 2 * i; j < 100; j += i){
                foo_arr[j] = 0;
            }
        }
    }
}

int main(){
    int main_arr[100];
    foo(main_arr); // a C array converts implicitly to a span of size 100
    for (int i = 0; i < 100; ++i){
        if (main_arr[i] == 1){
            std::cout << i << " ";
        }
    }
    std::cout << std::endl;
    return 0;
}
```

Here `main_arr` is memory allocated in the stack as a part of the `main` function. Since `main` outlives `foo`, `main` can share this memory with `foo`. There are some reasons this is undesirable. First, this solution presupposes that we know at compile time that we are only computing the primes below 100. If one day we need the primes below `n` then we cannot put `n` instead of 100, as the note above suggests. Second, in general stack memory is limited compared to the heap (a few megabytes per thread by default). Hence, the heap is generally the preferred storage for arrays.

## The Ranges and Algorithms Library

We close with the algorithms library, which recovers much of the comfort you are used to from Python: `sorted` with a key and `functools.reduce` both have counterparts here. Our example is the knapsack problem. We are given items, each with a weight and a value, and a knapsack of capacity 25, and we want to pack as much value as possible into it. We generate 10 random items and try the classic greedy heuristic: pack the items with the best value per weight first. Create `knapsack/knapsack.cpp`.

```cpp
#include <algorithm>
#include <format>
#include <iostream>
#include <random>
#include <vector>

struct KnapsackItem {
    int id;
    int weight;
    int value;
};

// A generator: a function object whose every call produces the next random item
class KnapsackItemGenerator {
public:
    KnapsackItem operator()(){
        return KnapsackItem{next_id_++, weight_dist_(gen_), value_dist_(gen_)};
    }
private:
    std::mt19937 gen_{std::random_device{}()};
    std::uniform_int_distribution<int> weight_dist_{1, 10};
    std::uniform_int_distribution<int> value_dist_{1, 100};
    int next_id_ = 0;
};

double get_value_to_weight_ratio(const KnapsackItem & item){
    return static_cast<double>(item.value) / item.weight;
}

void print_knapsack_item(const KnapsackItem & item){
    std::cout << std::format("item {:2}: value {:3} weight {:2}\n", item.id, item.value, item.weight);
}

// The state of the packing: what has been packed so far and the capacity that is left
struct PackingState {
    std::vector<KnapsackItem> packed;
    int remaining_capacity;
};

int main(){
    // a knapsack of capacity 25 and 10 random items with ids 0,1,2,...
    int capacity = 25;
    std::vector<KnapsackItem> items(10);
    std::ranges::generate_n(items.begin(), 10, KnapsackItemGenerator{});

    // Print the items
    std::cout << "Knapsack capacity: " << capacity << '\n';
    std::cout << "generated items: \n";
    std::ranges::for_each(items, print_knapsack_item);

    // sort the items by value per weight, best first
    std::ranges::sort(items, std::ranges::greater{}, get_value_to_weight_ratio);

    // Consider the current packing state and the next item: if the item fits, pack it, otherwise do not
    auto pack_if_fit = [](PackingState state, const KnapsackItem & item){
        if (item.weight <= state.remaining_capacity){
            state.packed.push_back(item);
            state.remaining_capacity -= item.weight;
        }
        return state;
    };
    // greedily pack the knapsack by folding over the items, best first
    PackingState final_state = std::ranges::fold_left(items, PackingState{{}, capacity}, pack_if_fit);

    std::cout << "packed items:\n";
    std::ranges::for_each(final_state.packed, print_knapsack_item);
    std::cout << std::format("packed weight {}\n", capacity - final_state.remaining_capacity);

    return 0;
}
```

A `struct` is a class whose members are public by default, and `KnapsackItem{next_id_++, weight_dist_(gen_), value_dist_(gen_)}` fills the members in declaration order. `KnapsackItemGenerator` is a function object with state — the random number generator, the distributions, and a counter — so every call produces the next item; since the members are initialized at their declaration, no constructor is needed.

`std::ranges::sort` takes a comparator and a projection: the projection computes a key for every element, the comparator orders the keys. With `get_value_to_weight_ratio` as the projection and `std::ranges::greater{}` as the comparator this is `sorted(items, key=get_value_to_weight_ratio, reverse=True)`. The id records where each item started, since the sort shuffles them. The algorithms library holds many more, `std::ranges::max_element`, `std::ranges::count_if`, `std::ranges::find`, and reaching for them before writing a loop by hand is considered good style.

The packing is `functools.reduce`: `fold_left` threads a `PackingState` — the packed items and the remaining capacity — through `pack`, one call per item. An item that does not fit is skipped rather than final, a later, lighter one may still be packed. The packed weight falls out of the final state as `capacity - final_state.remaining_capacity`.

All three kinds of callables from the section *Functions, Lambdas and Function Objects* have appeared: ordinary functions in `for_each` and as the sort's projection, a function object in `generate_n`, a lambda in `fold_left`.

Note that the greedy packing is a heuristic. It is not, in general, the optimal solution of the knapsack problem — finding that is much harder, and this course is about exactly such problems.

