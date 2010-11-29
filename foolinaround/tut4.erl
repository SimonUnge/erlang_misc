-module(tut4).
-export([list_length/1, len_rec/1, len_rec_acc/2]).

list_length([]) ->
    0;
list_length([First | Rest]) ->
    1 + list_length(Rest).

len_rec(List) ->
    len_rec_acc(List, 0).

len_rec_acc([],Acc) ->
    Acc;
len_rec_acc([First|Last], Acc) ->
    len_rec_acc(Last,Acc + 1).
