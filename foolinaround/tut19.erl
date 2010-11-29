-module(tut19).
-export([start_ping/1, start_pong/0, ping/2, pong/0]).

ping(0, Pong_Node) ->
    io:format("ping finished~n", []);
ping(N, Pong_Node) ->
    {pong, Pong_Node} ! {ping,self()},
    receive
	pong ->
	    io:format("Ping received pong~n", [])
    end,
    ping(N - 1, Pong_Node).

pong() ->
    receive
	{ping, Ping_ID} ->
	    io:format("Pong!!! received ping~n", []),
	    Ping_ID ! pong,
	    pong()
    after pong_timeout() ->
	    io:format("Pong timed out~n", [])
    end.

pong_timeout() ->
    5000.

start_pong() ->
    register(pong, spawn(tut19, pong, [])).

start_ping(Pong_Node) ->
    spawn(tut19, ping, [3, Pong_Node]).


