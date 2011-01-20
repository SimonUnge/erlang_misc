-module(99prop).
-compile(export_all).

last(H | []) ->
    H;
last(_| T) ->
    last(T).
