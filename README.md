# Euler Solutions in Elixir

In lieu of a real project, this is my attempt to learn some
[Elixir](http://elixir-lang.org/) by solving [Project
Euler](https://projecteuler.net/) problems.

The solutions are checked as part of unit tests by running:

```
mix test
```

Solution MD5 sums were taken from [Local
Euler](http://kmkeen.com/local-euler/).

The memory and CPU time used to solve a particular problem can be checked by running:

```
./profile [n]
```

where *[n]* is the problem number. For example:

```
./profile 10
        0.75 real         1.36 user         0.24 sys
 100143104  maximum resident set size
         0  average shared memory size
         0  average unshared data size
         0  average unshared stack size
     29878  page reclaims
         0  page faults
         0  swaps
         0  block input operations
         0  block output operations
         0  messages sent
         0  messages received
         9  signals received
       144  voluntary context switches
     21008  involuntary context switches
```
