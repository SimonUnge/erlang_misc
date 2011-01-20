-module(area_server1).
-export([area/2, start/0]).

start() ->
    spawn(fun loop/0).

area(Pid, What) ->
    rcp(Pid, What).

loop() ->
    receive
	{From, {rectangle, Width, Ht}} ->
	    Response = {rectangle, Width * Ht},
	    From ! {self(), Response},
	    loop();
	{From, {circle, R}} ->
	    Area = 3.14159 * R * R,
	    From ! {self(), Area},
	    loop();
	{From, Other} ->
	    From ! {error, Other},
	    loop()
    end.

rcp(Pid, Request) ->
    Pid ! {self(), Request},
    receive
	{Pid, Response} ->
	    Response
    end.
