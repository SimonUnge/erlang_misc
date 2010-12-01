-module(qsort_naiv).
-export([qsort/1]).

qsort([]) ->
    [];
qsort([Pivot|L]) ->
        qsort([X || X <- L, X < Pivot])
	++ [Pivot] ++
	qsort([X || X <- L, X >= Pivot]).
