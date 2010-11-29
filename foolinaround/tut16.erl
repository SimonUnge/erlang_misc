-module(tut16).
-export([start/0, ping/1, pong/0]).

ping(0) ->
    pong ! finished,
    io:format("ping finished~n", []);
ping(N) ->
    pong ! ping,
    receive
	pong -> 
	    io:format("Ping received pong~n", [])
    end,
    ping(N-1).

pong() ->
    receive
	finished ->
	    io:format("pong finished~n",[]);
	ping ->
	    io:format("Pong received ping~n", []),
	    ping ! pong,
	    pong()
    end.
 
start() ->
    register(pong, spawn(tut16, pong, [])),
    register(ping, spawn(tut16, ping, [3])).

