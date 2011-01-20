-module(prob81).
-export([start/2]).

start(AnAtom, Fun) ->
    case whereis(AnAtom) of
	undefined -> register(AnAtom, spawn(fun() -> Fun end));
	_ -> errlang:error()
    end.



