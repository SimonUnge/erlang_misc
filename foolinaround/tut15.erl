-module(tut15).
-export([start/0, ping/2, pong/0]).

ping(0, Pong_Pid) ->
    Pong_Pid ! finished,
    io:format("Ping finished~n",[]);
ping(N, Pong_Pid) ->
    Pong_Pid ! {ping, self()},
    receive
	pong -> 
	    io:format("Ping received pong~n",[])
    end,
    ping(N-1, Pong_Pid).

pong() ->
    receive
	finished ->
	    io:format("Pong finished~n", []);
	 {ping, Ping_Pid} ->
	    io:format("Pong received ping~n", []),
	    Ping_Pid ! pong,
	    pong()
    end.

start() ->
    Pong_Pid = spawn(tut15, pong,[]),
    spawn(tut15, ping, [3, Pong_Pid]).
