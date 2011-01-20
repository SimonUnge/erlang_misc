-module(nnp).
-compile(export_all).

%%P01
last([H | []]) ->
    H;
last([_| T]) ->
    last(T).

%%P02
last_but_one([]) ->
    exit(last_but_one);
last_but_one([P,_ | []]) ->
    P;
last_but_one([_ | T]) ->
    last_but_one(T).

%%P03
kth_element(0,[H | _]) ->
    H;
kth_element(N,[_ | T]) when N > 0 ->
    kth_element(N - 1, T).

%%P04
length_list([]) ->
    0;
length_list([_ | T]) ->
    1 + length(T).

%%P04 with acc
length_list2(List) ->
    length_list2_acc(0,List).

length_list2_acc(N,[]) ->
    N;
length_list2_acc(N,[_|T]) ->
    length_list2_acc(N + 1, T).

%%P05 XXX Bad naiva one. Best just use lists:reverse...
reverse_list([]) ->
    [];
reverse_list([H|T]) ->
    reverse_list(T) ++ [H].

%%P06
is_palindrome([_]) ->
    true;
is_palindrome(List) ->
    List =:= reverse_list(List).

%%P07
