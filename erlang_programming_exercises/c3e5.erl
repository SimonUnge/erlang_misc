-module(c3e5).
-compile(export_all).

reverse([]) ->
    [];
reverse([H|T]) ->
    reverse(T) ++ [H].

filter([],_) ->
    [];
filter([H|T], I) when I < H ->
    filter(T, I);
filter([H|T], I) ->
    [H | filter(T, I)].

filter1(List, I) ->
    [X|| X <- List, X =< I].

