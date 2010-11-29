-module(tut8).
-export([reverse/1]).

reverse(List) ->
    reverse(List, []).

reverse([X | Xs], Rev_list) ->
    reverse(Xs,[X|Rev_list]);
reverse([],Rev_list) ->
    Rev_list.
