-module(tut6).
-export([list_max/1]).

list_max([X|Xs]) ->
    list_max(Xs, X).

list_max([], Res) ->
    Res;
list_max([X|Xs], Result_so_far) when X > Result_so_far ->
    New_max = X,
    list_max(Xs,New_max);
list_max([X|Xs], Result_so_far) ->
    list_max(Xs, Result_so_far).
