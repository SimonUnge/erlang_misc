-module('e3-5').
-compile(export_all).

reverse([]) ->
    [];
reverse([H|T]) ->
    reverse(T) ++ [H].
