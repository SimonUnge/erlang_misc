-module(demo).
-compile(export_all).

sum(N) ->
    sum_acc(N,0).

sum_acc(N,Sum) when N > 0 ->
    sum_acc(N-1,Sum + N);
sum_acc(0,Sum) ->
    Sum.

sum(N,M) when N =:= M ->
    N;
sum(N,M) when N =< M ->
    N + sum(N+1, M);
sum(_N,_M) ->
    exit(n_bigger_than_m).

create(N) when N > 0->
    create_helper(1,N).

create_helper(N,N) ->
    [N];
create_helper(M, N) ->
    [M|create_helper(M + 1, N)].

create_even(N) ->
    even(create(N)).

even([]) ->
    [];
even([H|T]) when H rem 2 =:= 0 ->
    [H|even(T)];
even([_|T]) ->
    even(T).

reverse_create(N) ->
    lists:reverse(create(N)).

print_list(N) ->
    lists:foreach(fun(M) -> io:format("Number:~p~n",[M]) end, create(N)).

print_even(N) ->
    lists:foreach(fun(M) -> io:format("Number:~p~n",[M]) end, create_even(N)).
