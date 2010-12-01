-module(mylists).
-export([sum/1,map/2]).

sum(L) ->
    sum(L,0).

sum([],N) ->
    N;
sum([H|T],N) ->
    sum(T,N + H).

map(_, []) ->
    [];
map(Fun, [H|T]) ->
    [Fun(H)|map(Fun,T)].
